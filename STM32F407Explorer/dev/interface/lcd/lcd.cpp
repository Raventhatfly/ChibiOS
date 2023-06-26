//
// Created by Wu Feiyang on 2023/1/31.
//

#include "lcd.h"
#include "font.h"


uint16_t POINT_COLOR=0x0000;
uint16_t BACK_COLOR=0xFFFF;


lcd_dev lcddev;

void LCD_WR_REG(__IO uint16_t regval)
{
    regval=regval;  // delay that needs to add using -O2 optimization
    LCD->LCD_REG=regval;
}

void LCD_WR_DATA(__IO uint16_t data)
{
    data=data;
    LCD->LCD_RAM=data;
}

uint16_t LCD_RD_DATA()
{
    __IO uint16_t ram;
    ram=LCD->LCD_RAM;
    return ram;
}

void LCD_WriteReg(uint16_t LCD_Reg,uint16_t LCD_RegValue)
{
    LCD->LCD_REG = LCD_Reg;		//
    LCD->LCD_RAM = LCD_RegValue;//
}

uint16_t LCD_ReadReg(uint16_t LCD_Reg)
{
    LCD_WR_REG(LCD_Reg);
    chThdSleepMilliseconds(5);
    return LCD_RD_DATA();
}
//¿ªÊ¼Ð´GRAM
void LCD_WriteRAM_Prepare(void)
{
    LCD->LCD_REG=lcddev.wramcmd;
}

void LCD_WriteRAM(uint16_t RGB_Code)
{
    LCD->LCD_RAM = RGB_Code;//Ð´Ê®ÁùÎ»GRAM
}

uint16_t LCD_BGR2RGB(uint16_t c)
{
    uint16_t  r,g,b,rgb;
    b=(c>>0)&0x1f;
    g=(c>>5)&0x3f;
    r=(c>>11)&0x1f;
    rgb=(b<<11)+(g<<5)+(r<<0);
    return(rgb);
}

void opt_delay(uint8_t i)
{
    while(i--);
}

uint16_t LCD_ReadPoint(uint16_t x,uint16_t y)
{
    uint16_t r=0,g=0,b=0;
    if(x>=lcddev.width||y>=lcddev.height)return 0;	//³¬¹ýÁË·¶Î§,Ö±½Ó·µ»Ø
    LCD_SetCursor(x,y);
    if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(0X2E00);
    }
    else
    {
        LCD_WR_REG(0X2E);
    }
    r=LCD_RD_DATA();								//dummy Read
    if (lcddev.id == 0X1963)
    {
        return r;
    }
    r = LCD_RD_DATA();

    //9341/5310/5510/7789
    b = LCD_RD_DATA();
    g = r & 0XFF;
    g <<= 8;
    return (((r >> 11) << 11) | ((g >> 10) << 5) | (b >> 11));  // 9341/5310/5510/7789
}


void LCD_DisplayOn()
{
    if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(0X2900);
    }
    else
    {
        LCD_WR_REG(0X29);
    }
}

void LCD_DisplayOff()
{
    if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(0X2800);
    }
    else                        //9341/5310/1963/7789
    {
        LCD_WR_REG(0X28);
    }
}

void LCD_SetCursor(uint16_t Xpos, uint16_t Ypos)
{
    if (lcddev.id == 0X1963)
    {
        if (lcddev.dir == 0)   //
        {
            Xpos = lcddev.width - 1 - Xpos;
            LCD_WR_REG(lcddev.setxcmd);
            LCD_WR_DATA(0);
            LCD_WR_DATA(0);
            LCD_WR_DATA(Xpos >> 8);
            LCD_WR_DATA(Xpos & 0XFF);
        }
        else
        {
            LCD_WR_REG(lcddev.setxcmd);
            LCD_WR_DATA(Xpos >> 8);
            LCD_WR_DATA(Xpos & 0XFF);
            LCD_WR_DATA((lcddev.width - 1) >> 8);
            LCD_WR_DATA((lcddev.width - 1) & 0XFF);
        }

        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(Ypos >> 8);
        LCD_WR_DATA(Ypos & 0XFF);
        LCD_WR_DATA((lcddev.height - 1) >> 8);
        LCD_WR_DATA((lcddev.height - 1) & 0XFF);

    }
    else if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(Xpos >> 8);
        LCD_WR_REG(lcddev.setxcmd + 1);
        LCD_WR_DATA(Xpos & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(Ypos >> 8);
        LCD_WR_REG(lcddev.setycmd + 1);
        LCD_WR_DATA(Ypos & 0XFF);
    }
    else     //9341/5310/7789µÈÉèÖÃ×ø±ê
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(Xpos >> 8);
        LCD_WR_DATA(Xpos & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(Ypos >> 8);
        LCD_WR_DATA(Ypos & 0XFF);
    }
}


void LCD_Scan_Dir(uint8_t dir)
{
    uint16_t regval=0;
    uint16_t dirreg=0;
    uint16_t temp;
    if ((lcddev.dir == 1 && lcddev.id != 0X1963) || (lcddev.dir == 0 && lcddev.id == 0X1963))
    {
        switch (dir)   //·½Ïò×ª»»
        {
            case 0:
                dir = 6;
                break;

            case 1:
                dir = 7;
                break;

            case 2:
                dir = 4;
                break;

            case 3:
                dir = 5;
                break;

            case 4:
                dir = 1;
                break;

            case 5:
                dir = 0;
                break;

            case 6:
                dir = 3;
                break;

            case 7:
                dir = 2;
                break;
        }
    }

    switch (dir)
    {
        case L2R_U2D://´Ó×óµ½ÓÒ,´ÓÉÏµ½ÏÂ
            regval |= (0 << 7) | (0 << 6) | (0 << 5);
            break;

        case L2R_D2U://´Ó×óµ½ÓÒ,´ÓÏÂµ½ÉÏ
            regval |= (1 << 7) | (0 << 6) | (0 << 5);
            break;

        case R2L_U2D://´ÓÓÒµ½×ó,´ÓÉÏµ½ÏÂ
            regval |= (0 << 7) | (1 << 6) | (0 << 5);
            break;

        case R2L_D2U://´ÓÓÒµ½×ó,´ÓÏÂµ½ÉÏ
            regval |= (1 << 7) | (1 << 6) | (0 << 5);
            break;

        case U2D_L2R://´ÓÉÏµ½ÏÂ,´Ó×óµ½ÓÒ
            regval |= (0 << 7) | (0 << 6) | (1 << 5);
            break;

        case U2D_R2L://´ÓÉÏµ½ÏÂ,´ÓÓÒµ½×ó
            regval |= (0 << 7) | (1 << 6) | (1 << 5);
            break;

        case D2U_L2R://´ÓÏÂµ½ÉÏ,´Ó×óµ½ÓÒ
            regval |= (1 << 7) | (0 << 6) | (1 << 5);
            break;

        case D2U_R2L://´ÓÏÂµ½ÉÏ,´ÓÓÒµ½×ó
            regval |= (1 << 7) | (1 << 6) | (1 << 5);
            break;
    }

    if (lcddev.id == 0X5510)dirreg = 0X3600;
    else dirreg = 0X36;

    if (lcddev.id == 0X9341 || lcddev.id == 0X7789)   //9341 & 7789 ÒªÉèÖÃBGRÎ»
    {
        regval |= 0X08;
    }

    LCD_WriteReg(dirreg, regval);

    if (lcddev.id != 0X1963)   //1963²»×ö×ø±ê´¦Àí
    {
        if (regval & 0X20)
        {
            if (lcddev.width < lcddev.height)   //½»»»X,Y
            {
                temp = lcddev.width;
                lcddev.width = lcddev.height;
                lcddev.height = temp;
            }
        }
        else
        {
            if (lcddev.width > lcddev.height)   //½»»»X,Y
            {
                temp = lcddev.width;
                lcddev.width = lcddev.height;
                lcddev.height = temp;
            }
        }
    }

    //ÉèÖÃÏÔÊ¾ÇøÓò(¿ª´°)´óÐ¡
    if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(0);
        LCD_WR_REG(lcddev.setxcmd + 1);
        LCD_WR_DATA(0);
        LCD_WR_REG(lcddev.setxcmd + 2);
        LCD_WR_DATA((lcddev.width - 1) >> 8);
        LCD_WR_REG(lcddev.setxcmd + 3);
        LCD_WR_DATA((lcddev.width - 1) & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(0);
        LCD_WR_REG(lcddev.setycmd + 1);
        LCD_WR_DATA(0);
        LCD_WR_REG(lcddev.setycmd + 2);
        LCD_WR_DATA((lcddev.height - 1) >> 8);
        LCD_WR_REG(lcddev.setycmd + 3);
        LCD_WR_DATA((lcddev.height - 1) & 0XFF);
    }
    else
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(0);
        LCD_WR_DATA(0);
        LCD_WR_DATA((lcddev.width - 1) >> 8);
        LCD_WR_DATA((lcddev.width - 1) & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(0);
        LCD_WR_DATA(0);
        LCD_WR_DATA((lcddev.height - 1) >> 8);
        LCD_WR_DATA((lcddev.height - 1) & 0XFF);
    }
}

//»­µã
//x,y:×ø±ê
//POINT_COLOR:´ËµãµÄÑÕÉ«
void LCD_DrawPoint(uint16_t x,uint16_t y)
{
    LCD_SetCursor(x,y);		//ÉèÖÃ¹â±êÎ»ÖÃ
    LCD_WriteRAM_Prepare();	//¿ªÊ¼Ð´ÈëGRAM
    LCD->LCD_RAM=POINT_COLOR;
}
//¿ìËÙ»­µã
//x,y:×ø±ê
//color:ÑÕÉ«
void LCD_Fast_DrawPoint(uint16_t x,uint16_t y,uint16_t color)
{
    if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(x >> 8);
        LCD_WR_REG(lcddev.setxcmd + 1);
        LCD_WR_DATA(x & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(y >> 8);
        LCD_WR_REG(lcddev.setycmd + 1);
        LCD_WR_DATA(y & 0XFF);
    }
    else if (lcddev.id == 0X1963)
    {
        if (lcddev.dir == 0)x = lcddev.width - 1 - x;

        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(x >> 8);
        LCD_WR_DATA(x & 0XFF);
        LCD_WR_DATA(x >> 8);
        LCD_WR_DATA(x & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(y >> 8);
        LCD_WR_DATA(y & 0XFF);
        LCD_WR_DATA(y >> 8);
        LCD_WR_DATA(y & 0XFF);
    }
    else
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(x >> 8);
        LCD_WR_DATA(x & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(y >> 8);
        LCD_WR_DATA(y & 0XFF);
    }

    LCD->LCD_REG=lcddev.wramcmd;
    LCD->LCD_RAM=color;
}

//SSD1963 ±³¹âÉèÖÃ
//pwm:±³¹âµÈ¼¶,0~100.Ô½´óÔ½ÁÁ.
void LCD_SSD_BackLightSet(uint8_t pwm)
{
    LCD_WR_REG(0xBE);	//ÅäÖÃPWMÊä³ö
    LCD_WR_DATA(0x05);	//1ÉèÖÃPWMÆµÂÊ
    LCD_WR_DATA(pwm*2.55);//2ÉèÖÃPWMÕ¼¿Õ±È
    LCD_WR_DATA(0x01);	//3ÉèÖÃC
    LCD_WR_DATA(0xFF);	//4ÉèÖÃD
    LCD_WR_DATA(0x00);	//5ÉèÖÃE
    LCD_WR_DATA(0x00);	//6ÉèÖÃF
}


void LCD_Display_Dir(uint8_t dir)
{
    lcddev.dir = dir;       //ÊúÆÁ/ºáÆÁ

    if (dir == 0)           //ÊúÆÁ
    {
        lcddev.width = 240;
        lcddev.height = 320;

        if (lcddev.id == 0x5510)
        {
            lcddev.wramcmd = 0X2C00;
            lcddev.setxcmd = 0X2A00;
            lcddev.setycmd = 0X2B00;
            lcddev.width = 480;
            lcddev.height = 800;
        }
        else if (lcddev.id == 0X1963)
        {
            lcddev.wramcmd = 0X2C;  //ÉèÖÃÐ´ÈëGRAMµÄÖ¸Áî
            lcddev.setxcmd = 0X2B;  //ÉèÖÃÐ´X×ø±êÖ¸Áî
            lcddev.setycmd = 0X2A;  //ÉèÖÃÐ´Y×ø±êÖ¸Áî
            lcddev.width = 480;     //ÉèÖÃ¿í¶È480
            lcddev.height = 800;    //ÉèÖÃ¸ß¶È800
        }
        else                        //ÆäËûIC, °üÀ¨: 9341 / 5310 / 7789µÈIC
        {
            lcddev.wramcmd = 0X2C;
            lcddev.setxcmd = 0X2A;
            lcddev.setycmd = 0X2B;
        }

        if (lcddev.id == 0X5310)    //Èç¹ûÊÇ5310 Ôò±íÊ¾ÊÇ 320*480·Ö±æÂÊ
        {
            lcddev.width = 320;
            lcddev.height = 480;
        }
    }
    else     //ºáÆÁ
    {
        lcddev.width = 320;
        lcddev.height = 240;

        if (lcddev.id == 0x5510)
        {
            lcddev.wramcmd = 0X2C00;
            lcddev.setxcmd = 0X2A00;
            lcddev.setycmd = 0X2B00;
            lcddev.width = 800;
            lcddev.height = 480;
        }
        else if (lcddev.id == 0X1963)
        {
            lcddev.wramcmd = 0X2C;  //ÉèÖÃÐ´ÈëGRAMµÄÖ¸Áî
            lcddev.setxcmd = 0X2A;  //ÉèÖÃÐ´X×ø±êÖ¸Áî
            lcddev.setycmd = 0X2B;  //ÉèÖÃÐ´Y×ø±êÖ¸Áî
            lcddev.width = 800;     //ÉèÖÃ¿í¶È800
            lcddev.height = 480;    //ÉèÖÃ¸ß¶È480
        }
        else                        //ÆäËûIC, °üÀ¨: 9341 / 5310 / 7789µÈIC
        {
            lcddev.wramcmd = 0X2C;
            lcddev.setxcmd = 0X2A;
            lcddev.setycmd = 0X2B;
        }

        if (lcddev.id == 0X5310)    //Èç¹ûÊÇ5310 Ôò±íÊ¾ÊÇ 320*480·Ö±æÂÊ
        {
            lcddev.width = 480;
            lcddev.height = 320;
        }
    }

    LCD_Scan_Dir(DFT_SCAN_DIR);     //Ä¬ÈÏÉ¨Ãè·½Ïò
}

//ÉèÖÃ´°¿Ú,²¢×Ô¶¯ÉèÖÃ»­µã×ø±êµ½´°¿Ú×óÉÏ½Ç(sx,sy).
//sx,sy:´°¿ÚÆðÊ¼×ø±ê(×óÉÏ½Ç)
//width,height:´°¿Ú¿í¶ÈºÍ¸ß¶È,±ØÐë´óÓÚ0!!
//´°Ìå´óÐ¡:width*height.
void LCD_Set_Window(uint16_t sx, uint16_t sy, uint16_t width, uint16_t height)
{
    uint16_t twidth, theight;
    twidth = sx + width - 1;
    theight = sy + height - 1;

    if (lcddev.id == 0X1963 && lcddev.dir != 1)     //1963ÊúÆÁÌØÊâ´¦Àí
    {
        sx = lcddev.width - width - sx;
        height = sy + height - 1;
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(sx >> 8);
        LCD_WR_DATA(sx & 0XFF);
        LCD_WR_DATA((sx + width - 1) >> 8);
        LCD_WR_DATA((sx + width - 1) & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(sy >> 8);
        LCD_WR_DATA(sy & 0XFF);
        LCD_WR_DATA(height >> 8);
        LCD_WR_DATA(height & 0XFF);
    }
    else if (lcddev.id == 0X5510)
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(sx >> 8);
        LCD_WR_REG(lcddev.setxcmd + 1);
        LCD_WR_DATA(sx & 0XFF);
        LCD_WR_REG(lcddev.setxcmd + 2);
        LCD_WR_DATA(twidth >> 8);
        LCD_WR_REG(lcddev.setxcmd + 3);
        LCD_WR_DATA(twidth & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(sy >> 8);
        LCD_WR_REG(lcddev.setycmd + 1);
        LCD_WR_DATA(sy & 0XFF);
        LCD_WR_REG(lcddev.setycmd + 2);
        LCD_WR_DATA(theight >> 8);
        LCD_WR_REG(lcddev.setycmd + 3);
        LCD_WR_DATA(theight & 0XFF);
    }
    else     //9341/5310/7789/1963ºáÆÁ µÈ ÉèÖÃ´°¿Ú
    {
        LCD_WR_REG(lcddev.setxcmd);
        LCD_WR_DATA(sx >> 8);
        LCD_WR_DATA(sx & 0XFF);
        LCD_WR_DATA(twidth >> 8);
        LCD_WR_DATA(twidth & 0XFF);
        LCD_WR_REG(lcddev.setycmd);
        LCD_WR_DATA(sy >> 8);
        LCD_WR_DATA(sy & 0XFF);
        LCD_WR_DATA(theight >> 8);
        LCD_WR_DATA(theight & 0XFF);
    }
}


void LCD_Init()
{

    //RCC->AHB1ENR|=0XF<<3;
    //RCC->AHB1ENR|=1<<1;
    //RCC->AHB3ENR|=1<<0;
    palSetPadMode(GPIOB,15,PAL_MODE_OUTPUT_PUSHPULL);
    palSetPad(GPIOB,15);
    //GPIO_Set(GPIOB,PIN15,GPIO_MODE_OUT,GPIO_OTYPE_PP,GPIO_SPEED_50M,GPIO_PUPD_PU);							//PB15
    // TODO: Configure board.h here
//    GPIO_Set(GPIOD,(3<<0)|(3<<4)|(7<<8)|(3<<14),GPIO_MODE_AF,GPIO_OTYPE_PP,GPIO_SPEED_100M,GPIO_PUPD_PU);	//PD0,1,4,5,8,9,10,14,15 AF OUT
//    GPIO_Set(GPIOE,(0X1FF<<7),GPIO_MODE_AF,GPIO_OTYPE_PP,GPIO_SPEED_100M,GPIO_PUPD_PU);						//PE7~15,AF OUT
//    GPIO_Set(GPIOF,PIN12,GPIO_MODE_AF,GPIO_OTYPE_PP,GPIO_SPEED_100M,GPIO_PUPD_PU);							//PF12,FSMC_A6
//    GPIO_Set(GPIOG,PIN12,GPIO_MODE_AF,GPIO_OTYPE_PP,GPIO_SPEED_100M,GPIO_PUPD_PU);							//PG12,FSMC_NE4
//    GPIO_AF_Set(GPIOD,0,12);	//PD0,AF12
//    GPIO_AF_Set(GPIOD,1,12);	//PD1,AF12
//    GPIO_AF_Set(GPIOD,4,12);	//PD4,AF12
//    GPIO_AF_Set(GPIOD,5,12);	//PD5,AF12
//    GPIO_AF_Set(GPIOD,8,12);	//PD8,AF12
//    GPIO_AF_Set(GPIOD,9,12);	//PD9,AF12
//    GPIO_AF_Set(GPIOD,10,12);	//PD10,AF12
//    GPIO_AF_Set(GPIOD,14,12);	//PD14,AF12
//    GPIO_AF_Set(GPIOD,15,12);	//PD15,AF12

//    GPIO_AF_Set(GPIOE,7,12);	//PE7,AF12
//    GPIO_AF_Set(GPIOE,8,12);	//PE8,AF12
//    GPIO_AF_Set(GPIOE,9,12);	//PE9,AF12
//    GPIO_AF_Set(GPIOE,10,12);	//PE10,AF12
//    GPIO_AF_Set(GPIOE,11,12);	//PE11,AF12
//    GPIO_AF_Set(GPIOE,12,12);	//PE12,AF12
//    GPIO_AF_Set(GPIOE,13,12);	//PE13,AF12
//    GPIO_AF_Set(GPIOE,14,12);	//PE14,AF12
//    GPIO_AF_Set(GPIOE,15,12);	//PE15,AF12
//
//    GPIO_AF_Set(GPIOF,12,12);	//PF12,AF12
//    GPIO_AF_Set(GPIOG,12,12);	//PG12,AF12

/*    Using HAL, no need to do the following
 *
 *
 *
*/


//    FSMC_Bank1->BTCR[6]=0X00000000;
//    FSMC_Bank1->BTCR[7]=0X00000000;
//    FSMC_Bank1E->BWTR[6]=0X00000000;
//
//    FSMC_Bank1->BTCR[6]|=1<<12;		//´æ´¢Æ÷Ð´Ê¹ÄÜ
//    FSMC_Bank1->BTCR[6]|=1<<14;		//¶ÁÐ´Ê¹ÓÃ²»Í¬µÄÊ±Ðò
//    FSMC_Bank1->BTCR[6]|=1<<4; 		//´æ´¢Æ÷Êý¾Ý¿í¶ÈÎª16bit
//
//    FSMC_Bank1->BTCR[7]|=0<<28;		//Ä£Ê½A
//    FSMC_Bank1->BTCR[7]|=0XF<<0; 	//µØÖ·½¨Á¢Ê±¼ä(ADDSET)Îª15¸öHCLK 1/168M=6ns*15=90ns
//
//    FSMC_Bank1->BTCR[7]|=60<<8;  	//Êý¾Ý±£´æÊ±¼ä(DATAST)Îª60¸öHCLK	=6*60=360ns
//    //Ð´Ê±Ðò¿ØÖÆ¼Ä´æÆ÷
//    FSMC_Bank1E->BWTR[6]|=0<<28; 	//Ä£Ê½A
//    FSMC_Bank1E->BWTR[6]|=9<<0;		//µØÖ·½¨Á¢Ê±¼ä(ADDSET)Îª9¸öHCLK=54ns
//    //9¸öHCLK£¨HCLK=168M£©,Ä³Ð©Òº¾§Çý¶¯ICµÄÐ´ÐÅºÅÂö¿í£¬×îÉÙÒ²µÃ50ns¡£
//    FSMC_Bank1E->BWTR[6]|=8<<8; 	//Êý¾Ý±£´æÊ±¼ä(DATAST)Îª6ns*9¸öHCLK=54ns
//    //Ê¹ÄÜBANK1,ÇøÓò4
//    FSMC_Bank1->BTCR[6]|=1<<0;		//Ê¹ÄÜBANK1£¬ÇøÓò1

    chThdSleepMilliseconds(50);
    //delay_ms(50); // delay 50 ms

    LCD_WR_REG(0XD3);
    lcddev.id=LCD_RD_DATA();	//dummy read
    lcddev.id=LCD_RD_DATA();	//
    lcddev.id=LCD_RD_DATA();   	//
    lcddev.id<<=8;
    lcddev.id|=LCD_RD_DATA();  	//
    if(lcddev.id!=0X9341)		//
    {
        LCD_WR_REG(0X04);
        lcddev.id = LCD_RD_DATA();      //dummy read
        lcddev.id = LCD_RD_DATA();      //
        lcddev.id = LCD_RD_DATA();      //
        lcddev.id <<= 8;
        lcddev.id |= LCD_RD_DATA();

        if (lcddev.id == 0X8552)
        {
            lcddev.id = 0x7789;
        }

        if (lcddev.id != 0x7789)        //
        {

            LCD_WR_REG(0XD4);
            lcddev.id=LCD_RD_DATA();//dummy read
            lcddev.id=LCD_RD_DATA();//0X01
            lcddev.id=LCD_RD_DATA();//Ø0X53
            lcddev.id<<=8;
            lcddev.id|=LCD_RD_DATA();	//ÕâÀï¶Á»Ø0X10
            if(lcddev.id!=0X5310)		//Ò²²»ÊÇNT35310,³¢ÊÔ¿´¿´ÊÇ²»ÊÇNT35510
            {
                //·¢ËÍÃØÔ¿£¨³§¼ÒÌá¹©,ÕÕ°á¼´¿É£©
                LCD_WriteReg(0xF000, 0x0055);
                LCD_WriteReg(0xF001, 0x00AA);
                LCD_WriteReg(0xF002, 0x0052);
                LCD_WriteReg(0xF003, 0x0008);
                LCD_WriteReg(0xF004, 0x0001);

                LCD_WR_REG(0xC500);             //¶ÁÈ¡ID¸ß8Î»
                lcddev.id = LCD_RD_DATA();      //¶Á»Ø0X55
                lcddev.id <<= 8;

                LCD_WR_REG(0xC501);             //¶ÁÈ¡IDµÍ8Î»
                lcddev.id |= LCD_RD_DATA();     //¶Á»Ø0X10
                chThdSleepMilliseconds(5);
                if(lcddev.id==0x8000)lcddev.id=0x5510;//NT35510¶Á»ØµÄIDÊÇ8000H,Îª·½±ãÇø·Ö,ÎÒÃÇÇ¿ÖÆÉèÖÃÎª5510
                if(lcddev.id!=0X5510)   //Ò²²»ÊÇNT5510,³¢ÊÔ¿´¿´ÊÇ²»ÊÇSSD1963
                {
                    LCD_WR_REG(0XA1);
                    lcddev.id = LCD_RD_DATA();
                    lcddev.id = LCD_RD_DATA();  //¶Á»Ø0X57
                    lcddev.id <<= 8;
                    lcddev.id |= LCD_RD_DATA(); //¶Á»Ø0X61

                    if (lcddev.id == 0X5761)lcddev.id = 0X1963; //SSD1963¶Á»ØµÄIDÊÇ5761H,Îª·½±ãÇø·Ö,ÎÒÃÇÇ¿ÖÆÉèÖÃÎª1963
                }
            }
        }
    }
/* TODO: REENABLE THIS LATER
    printf(" LCD ID:%x\r\n", lcddev.id); //´òÓ¡LCD ID
*/
    if (lcddev.id == 0X9341)    //9341³õÊ¼»¯
    {
        LCD_WR_REG(0xCF);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC1);
        LCD_WR_DATA(0X30);
        LCD_WR_REG(0xED);
        LCD_WR_DATA(0x64);
        LCD_WR_DATA(0x03);
        LCD_WR_DATA(0X12);
        LCD_WR_DATA(0X81);
        LCD_WR_REG(0xE8);
        LCD_WR_DATA(0x85);
        LCD_WR_DATA(0x10);
        LCD_WR_DATA(0x7A);
        LCD_WR_REG(0xCB);
        LCD_WR_DATA(0x39);
        LCD_WR_DATA(0x2C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x34);
        LCD_WR_DATA(0x02);
        LCD_WR_REG(0xF7);
        LCD_WR_DATA(0x20);
        LCD_WR_REG(0xEA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0xC0);       //Power control
        LCD_WR_DATA(0x1B);      //VRH[5:0]
        LCD_WR_REG(0xC1);       //Power control
        LCD_WR_DATA(0x01);      //SAP[2:0];BT[3:0]
        LCD_WR_REG(0xC5);       //VCM control
        LCD_WR_DATA(0x30);      //3F
        LCD_WR_DATA(0x30);      //3C
        LCD_WR_REG(0xC7);       //VCM control2
        LCD_WR_DATA(0XB7);
        LCD_WR_REG(0x36);       // Memory Access Control
        LCD_WR_DATA(0x48);
        LCD_WR_REG(0x3A);
        LCD_WR_DATA(0x55);
        LCD_WR_REG(0xB1);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x1A);
        LCD_WR_REG(0xB6);       // Display Function Control
        LCD_WR_DATA(0x0A);
        LCD_WR_DATA(0xA2);
        LCD_WR_REG(0xF2);       // 3Gamma Function Disable
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0x26);       //Gamma curve selected
        LCD_WR_DATA(0x01);
        LCD_WR_REG(0xE0);       //Set Gamma
        LCD_WR_DATA(0x0F);
        LCD_WR_DATA(0x2A);
        LCD_WR_DATA(0x28);
        LCD_WR_DATA(0x08);
        LCD_WR_DATA(0x0E);
        LCD_WR_DATA(0x08);
        LCD_WR_DATA(0x54);
        LCD_WR_DATA(0XA9);
        LCD_WR_DATA(0x43);
        LCD_WR_DATA(0x0A);
        LCD_WR_DATA(0x0F);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0XE1);       //Set Gamma
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x15);
        LCD_WR_DATA(0x17);
        LCD_WR_DATA(0x07);
        LCD_WR_DATA(0x11);
        LCD_WR_DATA(0x06);
        LCD_WR_DATA(0x2B);
        LCD_WR_DATA(0x56);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x05);
        LCD_WR_DATA(0x10);
        LCD_WR_DATA(0x0F);
        LCD_WR_DATA(0x3F);
        LCD_WR_DATA(0x3F);
        LCD_WR_DATA(0x0F);
        LCD_WR_REG(0x2B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x3f);
        LCD_WR_REG(0x2A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xef);
        LCD_WR_REG(0x11);       //Exit Sleep
        chThdSleepMilliseconds(120);
        LCD_WR_REG(0x29);       //display on
    }
    else if (lcddev.id == 0x7789)   //7789³õÊ¼»¯
    {
        LCD_WR_REG(0x11);

        chThdSleepMilliseconds(120);

        LCD_WR_REG(0x36);
        LCD_WR_DATA(0x00);


        LCD_WR_REG(0x3A);
        LCD_WR_DATA(0X05);

        LCD_WR_REG(0xB2);
        LCD_WR_DATA(0x0C);
        LCD_WR_DATA(0x0C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x33);
        LCD_WR_DATA(0x33);

        LCD_WR_REG(0xB7);
        LCD_WR_DATA(0x35);

        LCD_WR_REG(0xBB);       //vcom
        LCD_WR_DATA(0x32);      //30

        LCD_WR_REG(0xC0);
        LCD_WR_DATA(0x0C);

        LCD_WR_REG(0xC2);
        LCD_WR_DATA(0x01);

        LCD_WR_REG(0xC3);       //vrh
        LCD_WR_DATA(0x10);      //17 0D

        LCD_WR_REG(0xC4);       //vdv
        LCD_WR_DATA(0x20);      //20

        LCD_WR_REG(0xC6);
        LCD_WR_DATA(0x0f);

        LCD_WR_REG(0xD0);
        LCD_WR_DATA(0xA4);
        LCD_WR_DATA(0xA1);

        LCD_WR_REG(0xE0);       //Set Gamma
        LCD_WR_DATA(0xd0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x07);
        LCD_WR_DATA(0x0a);
        LCD_WR_DATA(0x28);
        LCD_WR_DATA(0x32);
        LCD_WR_DATA(0X44);
        LCD_WR_DATA(0x42);
        LCD_WR_DATA(0x06);
        LCD_WR_DATA(0x0e);
        LCD_WR_DATA(0x12);
        LCD_WR_DATA(0x14);
        LCD_WR_DATA(0x17);


        LCD_WR_REG(0XE1);       //Set Gamma
        LCD_WR_DATA(0xd0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x07);
        LCD_WR_DATA(0x0a);
        LCD_WR_DATA(0x28);
        LCD_WR_DATA(0x31);
        LCD_WR_DATA(0x54);
        LCD_WR_DATA(0x47);
        LCD_WR_DATA(0x0e);
        LCD_WR_DATA(0x1c);
        LCD_WR_DATA(0x17);
        LCD_WR_DATA(0x1b);
        LCD_WR_DATA(0x1e);


        LCD_WR_REG(0x2A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xef);

        LCD_WR_REG(0x2B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x3f);

        LCD_WR_REG(0x29);       //display on
    }
    else if (lcddev.id == 0x5310)
    {
        LCD_WR_REG(0xED);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0xFE);

        LCD_WR_REG(0xEE);
        LCD_WR_DATA(0xDE);
        LCD_WR_DATA(0x21);

        LCD_WR_REG(0xF1);
        LCD_WR_DATA(0x01);
        LCD_WR_REG(0xDF);
        LCD_WR_DATA(0x10);

        //VCOMvoltage//
        LCD_WR_REG(0xC4);
        LCD_WR_DATA(0x8F);	  //5f

        LCD_WR_REG(0xC6);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xE2);
        LCD_WR_DATA(0xE2);
        LCD_WR_DATA(0xE2);
        LCD_WR_REG(0xBF);
        LCD_WR_DATA(0xAA);

        LCD_WR_REG(0xB0);
        LCD_WR_DATA(0x0D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x0D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x11);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x19);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x21);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x5D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x5D);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB1);
        LCD_WR_DATA(0x80);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x8B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x96);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x03);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB4);
        LCD_WR_DATA(0x8B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x96);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA1);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB5);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x03);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x04);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB6);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3F);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x5E);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x64);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x8C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xAC);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDC);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x70);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x90);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xEB);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDC);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xBA);
        LCD_WR_DATA(0x24);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC1);
        LCD_WR_DATA(0x20);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x54);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xFF);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC2);
        LCD_WR_DATA(0x0A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x04);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC3);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x39);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x37);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x36);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x32);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2F);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x29);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x26);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x24);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x24);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x23);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x36);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x32);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2F);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x29);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x26);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x24);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x24);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x23);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC4);
        LCD_WR_DATA(0x62);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x05);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x84);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x18);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA4);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x18);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x50);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x0C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x17);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x95);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xE6);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC5);
        LCD_WR_DATA(0x32);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x65);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x76);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC6);
        LCD_WR_DATA(0x20);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x17);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xC9);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE0);
        LCD_WR_DATA(0x16);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x1C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x21);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x36);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x46);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x52);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x64);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x7A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x8B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB9);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC4);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xCA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD9);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xE0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE1);
        LCD_WR_DATA(0x16);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x1C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x22);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x36);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x45);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x52);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x64);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x7A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x8B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB9);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC4);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xCA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xE0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE2);
        LCD_WR_DATA(0x05);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x0B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x1B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x34);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x4F);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x61);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x79);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x97);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA6);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD1);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD6);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDD);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0xE3);
        LCD_WR_DATA(0x05);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x1C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x33);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x50);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x62);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x78);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x97);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA6);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC7);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD1);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD5);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDD);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE4);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x2A);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x4B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x5D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x74);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x84);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x93);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xBE);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC4);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xCD);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDD);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0xE5);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x02);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x29);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x3C);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x4B);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x5D);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x74);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x84);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x93);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xA2);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xB3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xBE);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xC4);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xCD);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xD3);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xDC);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xF3);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE6);
        LCD_WR_DATA(0x11);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x34);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x56);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x76);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x77);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x66);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xBB);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x66);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x45);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x43);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE7);
        LCD_WR_DATA(0x32);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x76);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x66);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x67);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x67);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x87);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xBB);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x77);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x56);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x23);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x33);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x45);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE8);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x87);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x77);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x66);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x88);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xAA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0xBB);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x99);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x66);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x44);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x55);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xE9);
        LCD_WR_DATA(0xAA);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0x00);
        LCD_WR_DATA(0xAA);

        LCD_WR_REG(0xCF);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xF0);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x50);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xF3);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xF9);
        LCD_WR_DATA(0x06);
        LCD_WR_DATA(0x10);
        LCD_WR_DATA(0x29);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0x3A);
        LCD_WR_DATA(0x55);	//66

        LCD_WR_REG(0x11);
        chThdSleepMilliseconds(100);
        LCD_WR_REG(0x29);
        LCD_WR_REG(0x35);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0x51);
        LCD_WR_DATA(0xFF);
        LCD_WR_REG(0x53);
        LCD_WR_DATA(0x2C);
        LCD_WR_REG(0x55);
        LCD_WR_DATA(0x82);
        LCD_WR_REG(0x2c);
    }
    else if(lcddev.id==0x5510)
    {
        LCD_WriteReg(0xF000,0x55);
        LCD_WriteReg(0xF001,0xAA);
        LCD_WriteReg(0xF002,0x52);
        LCD_WriteReg(0xF003,0x08);
        LCD_WriteReg(0xF004,0x01);
        //AVDD Set AVDD 5.2V
        LCD_WriteReg(0xB000,0x0D);
        LCD_WriteReg(0xB001,0x0D);
        LCD_WriteReg(0xB002,0x0D);
        //AVDD ratio
        LCD_WriteReg(0xB600,0x34);
        LCD_WriteReg(0xB601,0x34);
        LCD_WriteReg(0xB602,0x34);
        //AVEE -5.2V
        LCD_WriteReg(0xB100,0x0D);
        LCD_WriteReg(0xB101,0x0D);
        LCD_WriteReg(0xB102,0x0D);
        //AVEE ratio
        LCD_WriteReg(0xB700,0x34);
        LCD_WriteReg(0xB701,0x34);
        LCD_WriteReg(0xB702,0x34);
        //VCL -2.5V
        LCD_WriteReg(0xB200,0x00);
        LCD_WriteReg(0xB201,0x00);
        LCD_WriteReg(0xB202,0x00);
        //VCL ratio
        LCD_WriteReg(0xB800,0x24);
        LCD_WriteReg(0xB801,0x24);
        LCD_WriteReg(0xB802,0x24);
        //VGH 15V (Free pump)
        LCD_WriteReg(0xBF00,0x01);
        LCD_WriteReg(0xB300,0x0F);
        LCD_WriteReg(0xB301,0x0F);
        LCD_WriteReg(0xB302,0x0F);
        //VGH ratio
        LCD_WriteReg(0xB900,0x34);
        LCD_WriteReg(0xB901,0x34);
        LCD_WriteReg(0xB902,0x34);
        //VGL_REG -10V
        LCD_WriteReg(0xB500,0x08);
        LCD_WriteReg(0xB501,0x08);
        LCD_WriteReg(0xB502,0x08);
        LCD_WriteReg(0xC200,0x03);
        //VGLX ratio
        LCD_WriteReg(0xBA00,0x24);
        LCD_WriteReg(0xBA01,0x24);
        LCD_WriteReg(0xBA02,0x24);
        //VGMP/VGSP 4.5V/0V
        LCD_WriteReg(0xBC00,0x00);
        LCD_WriteReg(0xBC01,0x78);
        LCD_WriteReg(0xBC02,0x00);
        //VGMN/VGSN -4.5V/0V
        LCD_WriteReg(0xBD00,0x00);
        LCD_WriteReg(0xBD01,0x78);
        LCD_WriteReg(0xBD02,0x00);
        //VCOM
        LCD_WriteReg(0xBE00,0x00);
        LCD_WriteReg(0xBE01,0x64);
        //Gamma Setting
        LCD_WriteReg(0xD100,0x00);
        LCD_WriteReg(0xD101,0x33);
        LCD_WriteReg(0xD102,0x00);
        LCD_WriteReg(0xD103,0x34);
        LCD_WriteReg(0xD104,0x00);
        LCD_WriteReg(0xD105,0x3A);
        LCD_WriteReg(0xD106,0x00);
        LCD_WriteReg(0xD107,0x4A);
        LCD_WriteReg(0xD108,0x00);
        LCD_WriteReg(0xD109,0x5C);
        LCD_WriteReg(0xD10A,0x00);
        LCD_WriteReg(0xD10B,0x81);
        LCD_WriteReg(0xD10C,0x00);
        LCD_WriteReg(0xD10D,0xA6);
        LCD_WriteReg(0xD10E,0x00);
        LCD_WriteReg(0xD10F,0xE5);
        LCD_WriteReg(0xD110,0x01);
        LCD_WriteReg(0xD111,0x13);
        LCD_WriteReg(0xD112,0x01);
        LCD_WriteReg(0xD113,0x54);
        LCD_WriteReg(0xD114,0x01);
        LCD_WriteReg(0xD115,0x82);
        LCD_WriteReg(0xD116,0x01);
        LCD_WriteReg(0xD117,0xCA);
        LCD_WriteReg(0xD118,0x02);
        LCD_WriteReg(0xD119,0x00);
        LCD_WriteReg(0xD11A,0x02);
        LCD_WriteReg(0xD11B,0x01);
        LCD_WriteReg(0xD11C,0x02);
        LCD_WriteReg(0xD11D,0x34);
        LCD_WriteReg(0xD11E,0x02);
        LCD_WriteReg(0xD11F,0x67);
        LCD_WriteReg(0xD120,0x02);
        LCD_WriteReg(0xD121,0x84);
        LCD_WriteReg(0xD122,0x02);
        LCD_WriteReg(0xD123,0xA4);
        LCD_WriteReg(0xD124,0x02);
        LCD_WriteReg(0xD125,0xB7);
        LCD_WriteReg(0xD126,0x02);
        LCD_WriteReg(0xD127,0xCF);
        LCD_WriteReg(0xD128,0x02);
        LCD_WriteReg(0xD129,0xDE);
        LCD_WriteReg(0xD12A,0x02);
        LCD_WriteReg(0xD12B,0xF2);
        LCD_WriteReg(0xD12C,0x02);
        LCD_WriteReg(0xD12D,0xFE);
        LCD_WriteReg(0xD12E,0x03);
        LCD_WriteReg(0xD12F,0x10);
        LCD_WriteReg(0xD130,0x03);
        LCD_WriteReg(0xD131,0x33);
        LCD_WriteReg(0xD132,0x03);
        LCD_WriteReg(0xD133,0x6D);
        LCD_WriteReg(0xD200,0x00);
        LCD_WriteReg(0xD201,0x33);
        LCD_WriteReg(0xD202,0x00);
        LCD_WriteReg(0xD203,0x34);
        LCD_WriteReg(0xD204,0x00);
        LCD_WriteReg(0xD205,0x3A);
        LCD_WriteReg(0xD206,0x00);
        LCD_WriteReg(0xD207,0x4A);
        LCD_WriteReg(0xD208,0x00);
        LCD_WriteReg(0xD209,0x5C);
        LCD_WriteReg(0xD20A,0x00);

        LCD_WriteReg(0xD20B,0x81);
        LCD_WriteReg(0xD20C,0x00);
        LCD_WriteReg(0xD20D,0xA6);
        LCD_WriteReg(0xD20E,0x00);
        LCD_WriteReg(0xD20F,0xE5);
        LCD_WriteReg(0xD210,0x01);
        LCD_WriteReg(0xD211,0x13);
        LCD_WriteReg(0xD212,0x01);
        LCD_WriteReg(0xD213,0x54);
        LCD_WriteReg(0xD214,0x01);
        LCD_WriteReg(0xD215,0x82);
        LCD_WriteReg(0xD216,0x01);
        LCD_WriteReg(0xD217,0xCA);
        LCD_WriteReg(0xD218,0x02);
        LCD_WriteReg(0xD219,0x00);
        LCD_WriteReg(0xD21A,0x02);
        LCD_WriteReg(0xD21B,0x01);
        LCD_WriteReg(0xD21C,0x02);
        LCD_WriteReg(0xD21D,0x34);
        LCD_WriteReg(0xD21E,0x02);
        LCD_WriteReg(0xD21F,0x67);
        LCD_WriteReg(0xD220,0x02);
        LCD_WriteReg(0xD221,0x84);
        LCD_WriteReg(0xD222,0x02);
        LCD_WriteReg(0xD223,0xA4);
        LCD_WriteReg(0xD224,0x02);
        LCD_WriteReg(0xD225,0xB7);
        LCD_WriteReg(0xD226,0x02);
        LCD_WriteReg(0xD227,0xCF);
        LCD_WriteReg(0xD228,0x02);
        LCD_WriteReg(0xD229,0xDE);
        LCD_WriteReg(0xD22A,0x02);
        LCD_WriteReg(0xD22B,0xF2);
        LCD_WriteReg(0xD22C,0x02);
        LCD_WriteReg(0xD22D,0xFE);
        LCD_WriteReg(0xD22E,0x03);
        LCD_WriteReg(0xD22F,0x10);
        LCD_WriteReg(0xD230,0x03);
        LCD_WriteReg(0xD231,0x33);
        LCD_WriteReg(0xD232,0x03);
        LCD_WriteReg(0xD233,0x6D);
        LCD_WriteReg(0xD300,0x00);
        LCD_WriteReg(0xD301,0x33);
        LCD_WriteReg(0xD302,0x00);
        LCD_WriteReg(0xD303,0x34);
        LCD_WriteReg(0xD304,0x00);
        LCD_WriteReg(0xD305,0x3A);
        LCD_WriteReg(0xD306,0x00);
        LCD_WriteReg(0xD307,0x4A);
        LCD_WriteReg(0xD308,0x00);
        LCD_WriteReg(0xD309,0x5C);
        LCD_WriteReg(0xD30A,0x00);

        LCD_WriteReg(0xD30B,0x81);
        LCD_WriteReg(0xD30C,0x00);
        LCD_WriteReg(0xD30D,0xA6);
        LCD_WriteReg(0xD30E,0x00);
        LCD_WriteReg(0xD30F,0xE5);
        LCD_WriteReg(0xD310,0x01);
        LCD_WriteReg(0xD311,0x13);
        LCD_WriteReg(0xD312,0x01);
        LCD_WriteReg(0xD313,0x54);
        LCD_WriteReg(0xD314,0x01);
        LCD_WriteReg(0xD315,0x82);
        LCD_WriteReg(0xD316,0x01);
        LCD_WriteReg(0xD317,0xCA);
        LCD_WriteReg(0xD318,0x02);
        LCD_WriteReg(0xD319,0x00);
        LCD_WriteReg(0xD31A,0x02);
        LCD_WriteReg(0xD31B,0x01);
        LCD_WriteReg(0xD31C,0x02);
        LCD_WriteReg(0xD31D,0x34);
        LCD_WriteReg(0xD31E,0x02);
        LCD_WriteReg(0xD31F,0x67);
        LCD_WriteReg(0xD320,0x02);
        LCD_WriteReg(0xD321,0x84);
        LCD_WriteReg(0xD322,0x02);
        LCD_WriteReg(0xD323,0xA4);
        LCD_WriteReg(0xD324,0x02);
        LCD_WriteReg(0xD325,0xB7);
        LCD_WriteReg(0xD326,0x02);
        LCD_WriteReg(0xD327,0xCF);
        LCD_WriteReg(0xD328,0x02);
        LCD_WriteReg(0xD329,0xDE);
        LCD_WriteReg(0xD32A,0x02);
        LCD_WriteReg(0xD32B,0xF2);
        LCD_WriteReg(0xD32C,0x02);
        LCD_WriteReg(0xD32D,0xFE);
        LCD_WriteReg(0xD32E,0x03);
        LCD_WriteReg(0xD32F,0x10);
        LCD_WriteReg(0xD330,0x03);
        LCD_WriteReg(0xD331,0x33);
        LCD_WriteReg(0xD332,0x03);
        LCD_WriteReg(0xD333,0x6D);
        LCD_WriteReg(0xD400,0x00);
        LCD_WriteReg(0xD401,0x33);
        LCD_WriteReg(0xD402,0x00);
        LCD_WriteReg(0xD403,0x34);
        LCD_WriteReg(0xD404,0x00);
        LCD_WriteReg(0xD405,0x3A);
        LCD_WriteReg(0xD406,0x00);
        LCD_WriteReg(0xD407,0x4A);
        LCD_WriteReg(0xD408,0x00);
        LCD_WriteReg(0xD409,0x5C);
        LCD_WriteReg(0xD40A,0x00);
        LCD_WriteReg(0xD40B,0x81);

        LCD_WriteReg(0xD40C,0x00);
        LCD_WriteReg(0xD40D,0xA6);
        LCD_WriteReg(0xD40E,0x00);
        LCD_WriteReg(0xD40F,0xE5);
        LCD_WriteReg(0xD410,0x01);
        LCD_WriteReg(0xD411,0x13);
        LCD_WriteReg(0xD412,0x01);
        LCD_WriteReg(0xD413,0x54);
        LCD_WriteReg(0xD414,0x01);
        LCD_WriteReg(0xD415,0x82);
        LCD_WriteReg(0xD416,0x01);
        LCD_WriteReg(0xD417,0xCA);
        LCD_WriteReg(0xD418,0x02);
        LCD_WriteReg(0xD419,0x00);
        LCD_WriteReg(0xD41A,0x02);
        LCD_WriteReg(0xD41B,0x01);
        LCD_WriteReg(0xD41C,0x02);
        LCD_WriteReg(0xD41D,0x34);
        LCD_WriteReg(0xD41E,0x02);
        LCD_WriteReg(0xD41F,0x67);
        LCD_WriteReg(0xD420,0x02);
        LCD_WriteReg(0xD421,0x84);
        LCD_WriteReg(0xD422,0x02);
        LCD_WriteReg(0xD423,0xA4);
        LCD_WriteReg(0xD424,0x02);
        LCD_WriteReg(0xD425,0xB7);
        LCD_WriteReg(0xD426,0x02);
        LCD_WriteReg(0xD427,0xCF);
        LCD_WriteReg(0xD428,0x02);
        LCD_WriteReg(0xD429,0xDE);
        LCD_WriteReg(0xD42A,0x02);
        LCD_WriteReg(0xD42B,0xF2);
        LCD_WriteReg(0xD42C,0x02);
        LCD_WriteReg(0xD42D,0xFE);
        LCD_WriteReg(0xD42E,0x03);
        LCD_WriteReg(0xD42F,0x10);
        LCD_WriteReg(0xD430,0x03);
        LCD_WriteReg(0xD431,0x33);
        LCD_WriteReg(0xD432,0x03);
        LCD_WriteReg(0xD433,0x6D);
        LCD_WriteReg(0xD500,0x00);
        LCD_WriteReg(0xD501,0x33);
        LCD_WriteReg(0xD502,0x00);
        LCD_WriteReg(0xD503,0x34);
        LCD_WriteReg(0xD504,0x00);
        LCD_WriteReg(0xD505,0x3A);
        LCD_WriteReg(0xD506,0x00);
        LCD_WriteReg(0xD507,0x4A);
        LCD_WriteReg(0xD508,0x00);
        LCD_WriteReg(0xD509,0x5C);
        LCD_WriteReg(0xD50A,0x00);
        LCD_WriteReg(0xD50B,0x81);

        LCD_WriteReg(0xD50C,0x00);
        LCD_WriteReg(0xD50D,0xA6);
        LCD_WriteReg(0xD50E,0x00);
        LCD_WriteReg(0xD50F,0xE5);
        LCD_WriteReg(0xD510,0x01);
        LCD_WriteReg(0xD511,0x13);
        LCD_WriteReg(0xD512,0x01);
        LCD_WriteReg(0xD513,0x54);
        LCD_WriteReg(0xD514,0x01);
        LCD_WriteReg(0xD515,0x82);
        LCD_WriteReg(0xD516,0x01);
        LCD_WriteReg(0xD517,0xCA);
        LCD_WriteReg(0xD518,0x02);
        LCD_WriteReg(0xD519,0x00);
        LCD_WriteReg(0xD51A,0x02);
        LCD_WriteReg(0xD51B,0x01);
        LCD_WriteReg(0xD51C,0x02);
        LCD_WriteReg(0xD51D,0x34);
        LCD_WriteReg(0xD51E,0x02);
        LCD_WriteReg(0xD51F,0x67);
        LCD_WriteReg(0xD520,0x02);
        LCD_WriteReg(0xD521,0x84);
        LCD_WriteReg(0xD522,0x02);
        LCD_WriteReg(0xD523,0xA4);
        LCD_WriteReg(0xD524,0x02);
        LCD_WriteReg(0xD525,0xB7);
        LCD_WriteReg(0xD526,0x02);
        LCD_WriteReg(0xD527,0xCF);
        LCD_WriteReg(0xD528,0x02);
        LCD_WriteReg(0xD529,0xDE);
        LCD_WriteReg(0xD52A,0x02);
        LCD_WriteReg(0xD52B,0xF2);
        LCD_WriteReg(0xD52C,0x02);
        LCD_WriteReg(0xD52D,0xFE);
        LCD_WriteReg(0xD52E,0x03);
        LCD_WriteReg(0xD52F,0x10);
        LCD_WriteReg(0xD530,0x03);
        LCD_WriteReg(0xD531,0x33);
        LCD_WriteReg(0xD532,0x03);
        LCD_WriteReg(0xD533,0x6D);
        LCD_WriteReg(0xD600,0x00);
        LCD_WriteReg(0xD601,0x33);
        LCD_WriteReg(0xD602,0x00);
        LCD_WriteReg(0xD603,0x34);
        LCD_WriteReg(0xD604,0x00);
        LCD_WriteReg(0xD605,0x3A);
        LCD_WriteReg(0xD606,0x00);
        LCD_WriteReg(0xD607,0x4A);
        LCD_WriteReg(0xD608,0x00);
        LCD_WriteReg(0xD609,0x5C);
        LCD_WriteReg(0xD60A,0x00);
        LCD_WriteReg(0xD60B,0x81);

        LCD_WriteReg(0xD60C,0x00);
        LCD_WriteReg(0xD60D,0xA6);
        LCD_WriteReg(0xD60E,0x00);
        LCD_WriteReg(0xD60F,0xE5);
        LCD_WriteReg(0xD610,0x01);
        LCD_WriteReg(0xD611,0x13);
        LCD_WriteReg(0xD612,0x01);
        LCD_WriteReg(0xD613,0x54);
        LCD_WriteReg(0xD614,0x01);
        LCD_WriteReg(0xD615,0x82);
        LCD_WriteReg(0xD616,0x01);
        LCD_WriteReg(0xD617,0xCA);
        LCD_WriteReg(0xD618,0x02);
        LCD_WriteReg(0xD619,0x00);
        LCD_WriteReg(0xD61A,0x02);
        LCD_WriteReg(0xD61B,0x01);
        LCD_WriteReg(0xD61C,0x02);
        LCD_WriteReg(0xD61D,0x34);
        LCD_WriteReg(0xD61E,0x02);
        LCD_WriteReg(0xD61F,0x67);
        LCD_WriteReg(0xD620,0x02);
        LCD_WriteReg(0xD621,0x84);
        LCD_WriteReg(0xD622,0x02);
        LCD_WriteReg(0xD623,0xA4);
        LCD_WriteReg(0xD624,0x02);
        LCD_WriteReg(0xD625,0xB7);
        LCD_WriteReg(0xD626,0x02);
        LCD_WriteReg(0xD627,0xCF);
        LCD_WriteReg(0xD628,0x02);
        LCD_WriteReg(0xD629,0xDE);
        LCD_WriteReg(0xD62A,0x02);
        LCD_WriteReg(0xD62B,0xF2);
        LCD_WriteReg(0xD62C,0x02);
        LCD_WriteReg(0xD62D,0xFE);
        LCD_WriteReg(0xD62E,0x03);
        LCD_WriteReg(0xD62F,0x10);
        LCD_WriteReg(0xD630,0x03);
        LCD_WriteReg(0xD631,0x33);
        LCD_WriteReg(0xD632,0x03);
        LCD_WriteReg(0xD633,0x6D);
        //LV2 Page 0 enable
        LCD_WriteReg(0xF000,0x55);
        LCD_WriteReg(0xF001,0xAA);
        LCD_WriteReg(0xF002,0x52);
        LCD_WriteReg(0xF003,0x08);
        LCD_WriteReg(0xF004,0x00);
        //Display control
        LCD_WriteReg(0xB100, 0xCC);
        LCD_WriteReg(0xB101, 0x00);
        //Source hold time
        LCD_WriteReg(0xB600,0x05);
        //Gate EQ control
        LCD_WriteReg(0xB700,0x70);
        LCD_WriteReg(0xB701,0x70);
        //Source EQ control (Mode 2)
        LCD_WriteReg(0xB800,0x01);
        LCD_WriteReg(0xB801,0x03);
        LCD_WriteReg(0xB802,0x03);
        LCD_WriteReg(0xB803,0x03);
        //Inversion mode (2-dot)
        LCD_WriteReg(0xBC00,0x02);
        LCD_WriteReg(0xBC01,0x00);
        LCD_WriteReg(0xBC02,0x00);
        //Timing control 4H w/ 4-delay
        LCD_WriteReg(0xC900,0xD0);
        LCD_WriteReg(0xC901,0x02);
        LCD_WriteReg(0xC902,0x50);
        LCD_WriteReg(0xC903,0x50);
        LCD_WriteReg(0xC904,0x50);
        LCD_WriteReg(0x3500,0x00);
        LCD_WriteReg(0x3A00,0x55);  //16-bit/pixel
        LCD_WR_REG(0x1100);
        chThdSleepMilliseconds(120);
        LCD_WR_REG(0x2900);
    }
    else if(lcddev.id==0X1963)
    {
        LCD_WR_REG(0xE2);		//Set PLL with OSC = 10MHz (hardware),	Multiplier N = 35, 250MHz < VCO < 800MHz = OSC*(N+1), VCO = 300MHz
        LCD_WR_DATA(0x1D);		//²ÎÊý1
        LCD_WR_DATA(0x02);		//²ÎÊý2 Divider M = 2, PLL = 300/(M+1) = 100MHz
        LCD_WR_DATA(0x04);		//²ÎÊý3 Validate M and N values
        chThdSleepMilliseconds(100);
        LCD_WR_REG(0xE0);		// Start PLL command
        LCD_WR_DATA(0x01);		// enable PLL
        chThdSleepMilliseconds(10);
        LCD_WR_REG(0xE0);		// Start PLL command again
        LCD_WR_DATA(0x03);		// now, use PLL output as system clock
        chThdSleepMilliseconds(12);
        LCD_WR_REG(0x01);
        chThdSleepMilliseconds(10);

        LCD_WR_REG(0xE6);
        LCD_WR_DATA(0x2F);
        LCD_WR_DATA(0xFF);
        LCD_WR_DATA(0xFF);

        LCD_WR_REG(0xB0);
        LCD_WR_DATA(0x20);		//24Î»Ä£Ê½
        LCD_WR_DATA(0x00);		//TFT Ä£Ê½

        LCD_WR_DATA((SSD_HOR_RESOLUTION-1)>>8);//ÉèÖÃLCDË®Æ½ÏñËØ
        LCD_WR_DATA(SSD_HOR_RESOLUTION-1);
        LCD_WR_DATA((SSD_VER_RESOLUTION-1)>>8);//ÉèÖÃLCD´¹Ö±ÏñËØ
        LCD_WR_DATA(SSD_VER_RESOLUTION-1);
        LCD_WR_DATA(0x00);		//RGBÐòÁÐ

        LCD_WR_REG(0xB4);		//Set horizontal period
        LCD_WR_DATA((SSD_HT-1)>>8);
        LCD_WR_DATA(SSD_HT-1);
        LCD_WR_DATA(SSD_HPS>>8);
        LCD_WR_DATA(SSD_HPS);
        LCD_WR_DATA(SSD_HOR_PULSE_WIDTH-1);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_REG(0xB6);		//Set vertical period
        LCD_WR_DATA((SSD_VT-1)>>8);
        LCD_WR_DATA(SSD_VT-1);
        LCD_WR_DATA(SSD_VPS>>8);
        LCD_WR_DATA(SSD_VPS);
        LCD_WR_DATA(SSD_VER_FRONT_PORCH-1);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xF0);
        LCD_WR_DATA(0x03);

        LCD_WR_REG(0x29);

        LCD_WR_REG(0xD0);
        LCD_WR_DATA(0x00);	//disable

        LCD_WR_REG(0xBE);
        LCD_WR_DATA(0x05);
        LCD_WR_DATA(0xFE);
        LCD_WR_DATA(0x01);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);
        LCD_WR_DATA(0x00);

        LCD_WR_REG(0xB8);
        LCD_WR_DATA(0x03);
        LCD_WR_DATA(0x01);
        LCD_WR_REG(0xBA);
        LCD_WR_DATA(0X01);	//GPIO[1:0]=01

        LCD_SSD_BackLightSet(100);
    }

    if(lcddev.id==0X9341||lcddev.id==0x7789||lcddev.id==0X5310||lcddev.id==0X5510||lcddev.id==0X1963)
    {

        FSMC_Bank1E->BWTR[6]&=~(0XF<<0);
        FSMC_Bank1E->BWTR[6]&=~(0XF<<8);
        FSMC_Bank1E->BWTR[6]|=3<<0;



        FSMC_Bank1E->BWTR[6]|=3<<8;
        FSMC_Bank1E->BWTR[6]|=2<<8;
    }
    LCD_Display_Dir(0);
    /*TODO: REENABLE THIS LATER*/
    //LCD_LED=1;
    LCD_Clear(WHITE);
}

void LCD_Clear(uint16_t color)
{
    uint32_t index = 0;
    uint32_t totalpoint = lcddev.width;
    totalpoint *= lcddev.height;    //µÃµ½×ÜµãÊý

    LCD_SetCursor(0x00, 0x0000);    //ÉèÖÃ¹â±êÎ»ÖÃ
    LCD_WriteRAM_Prepare();         //¿ªÊ¼Ð´ÈëGRAM

    for (index = 0; index < totalpoint; index++)
    {
        LCD->LCD_RAM=color;
    }
}

//ÔÚÖ¸¶¨ÇøÓòÄÚÌî³äÖ¸¶¨ÑÕÉ«
//ÇøÓò´óÐ¡:(xend-xsta+1)*(yend-ysta+1)
//xsta
//color:ÒªÌî³äµÄÑÕÉ«
void LCD_Fill(uint16_t sx, uint16_t sy, uint16_t ex, uint16_t ey, uint16_t color)
{
    uint16_t i, j;
    uint16_t xlen = 0;

    xlen = ex - sx + 1;

    for (i = sy; i <= ey; i++)
    {
        LCD_SetCursor(sx, i);       //ÉèÖÃ¹â±êÎ»ÖÃ
        LCD_WriteRAM_Prepare();     //¿ªÊ¼Ð´ÈëGRAM

        for (j = 0; j < xlen; j++)
        {
            LCD->LCD_RAM=color;     //ÉèÖÃ¹â±êÎ»ÖÃ
        }
    }
}


void LCD_Color_Fill(uint16_t sx, uint16_t sy, uint16_t ex, uint16_t ey, uint16_t *color)
{
    uint16_t height, width;
    uint16_t i, j;
    width = ex - sx + 1;            //µÃµ½Ìî³äµÄ¿í¶È
    height = ey - sy + 1;           //¸ß¶È

    for (i = 0; i < height; i++)
    {
        LCD_SetCursor(sx, sy + i);  //ÉèÖÃ¹â±êÎ»ÖÃ
        LCD_WriteRAM_Prepare();     //¿ªÊ¼Ð´ÈëGRAM

        for (j = 0; j < width; j++)
        {
            LCD->LCD_RAM=color[i * width + j];  //Ð´ÈëÊý¾Ý
        }
    }
}

//»­Ïß
//x1,y1:Æðµã×ø±ê
//x2,y2:ÖÕµã×ø±ê
void LCD_DrawLine(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
    uint16_t t;
    int xerr = 0, yerr = 0, delta_x, delta_y, distance;
    int incx, incy, uRow, uCol;
    delta_x = x2 - x1;              //¼ÆËã×ø±êÔöÁ¿
    delta_y = y2 - y1;
    uRow = x1;
    uCol = y1;

    if (delta_x > 0)incx = 1;       //ÉèÖÃµ¥²½·½Ïò
    else if (delta_x == 0)incx = 0; //´¹Ö±Ïß
    else
    {
        incx = -1;
        delta_x = -delta_x;
    }

    if (delta_y > 0)incy = 1;
    else if (delta_y == 0)incy = 0; //Ë®Æ½Ïß
    else
    {
        incy = -1;
        delta_y = -delta_y;
    }

    if ( delta_x > delta_y)distance = delta_x; //Ñ¡È¡»ù±¾ÔöÁ¿×ø±êÖá
    else distance = delta_y;

    for (t = 0; t <= distance + 1; t++ )    //»­ÏßÊä³ö
    {
        LCD_DrawPoint(uRow, uCol); //»­µã
        xerr += delta_x ;
        yerr += delta_y ;

        if (xerr > distance)
        {
            xerr -= distance;
            uRow += incx;
        }

        if (yerr > distance)
        {
            yerr -= distance;
            uCol += incy;
        }
    }
}


void LCD_DrawRectangle(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2)
{
    LCD_DrawLine(x1,y1,x2,y1);
    LCD_DrawLine(x1,y1,x1,y2);
    LCD_DrawLine(x1,y2,x2,y2);
    LCD_DrawLine(x2,y1,x2,y2);
}

void LCD_Draw_Circle(uint16_t x0,uint16_t y0,uint8_t r)
{
    int a, b;
    int di;
    a = 0;
    b = r;
    di = 3 - (r << 1);       //ÅÐ¶ÏÏÂ¸öµãÎ»ÖÃµÄ±êÖ¾

    while (a <= b)
    {
        LCD_DrawPoint(x0 + a, y0 - b);        //5
        LCD_DrawPoint(x0 + b, y0 - a);        //0
        LCD_DrawPoint(x0 + b, y0 + a);        //4
        LCD_DrawPoint(x0 + a, y0 + b);        //6
        LCD_DrawPoint(x0 - a, y0 + b);        //1
        LCD_DrawPoint(x0 - b, y0 + a);
        LCD_DrawPoint(x0 - a, y0 - b);        //2
        LCD_DrawPoint(x0 - b, y0 - a);        //7
        a++;


        if (di < 0)di += 4 * a + 6;
        else
        {
            di += 10 + 4 * (a - b);
            b--;
        }
    }
}

void LCD_ShowChar(uint16_t x,uint16_t y,uint8_t num,uint8_t size,uint8_t mode)
{
    uint8_t temp,t1,t;
    uint16_t y0=y;
    uint8_t csize=(size/8+((size%8)?1:0))*(size/2);		//µÃµ½×ÖÌåÒ»¸ö×Ö·û¶ÔÓ¦µãÕó¼¯ËùÕ¼µÄ×Ö½ÚÊý
    num=num-' ';//µÃµ½Æ«ÒÆºóµÄÖµ£¨ASCII×Ö¿âÊÇ´Ó¿Õ¸ñ¿ªÊ¼È¡Ä££¬ËùÒÔ-' '¾ÍÊÇ¶ÔÓ¦×Ö·ûµÄ×Ö¿â£©
    for(t=0;t<csize;t++)
    {
        if(size==12)temp=asc2_1206[num][t]; 	 	//µ÷ÓÃ1206×ÖÌå
        else if(size==16)temp=asc2_1608[num][t];	//µ÷ÓÃ1608×ÖÌå
        else if(size==24)temp=asc2_2412[num][t];	//µ÷ÓÃ2412×ÖÌå
        else return;								//Ã»ÓÐµÄ×Ö¿â
        for(t1=0;t1<8;t1++)
        {
            if(temp&0x80)LCD_Fast_DrawPoint(x,y,POINT_COLOR);
            else if(mode==0)LCD_Fast_DrawPoint(x,y,BACK_COLOR);
            temp<<=1;
            y++;
            if(y>=lcddev.height)return;		//³¬ÇøÓòÁË
            if((y-y0)==size)
            {
                y=y0;
                x++;
                if(x>=lcddev.width)return;	//³¬ÇøÓòÁË
                break;
            }
        }
    }
}

uint32_t LCD_Pow(uint8_t m,uint8_t n)
{
    uint32_t result=1;
    while(n--)result*=m;
    return result;
}

void LCD_ShowNum(uint16_t x, uint16_t y, uint32_t num, uint8_t len, uint8_t size)
{
    uint8_t t, temp;
    uint8_t enshow = 0;

    for (t = 0; t < len; t++)
    {
        temp = (num / LCD_Pow(10, len - t - 1)) % 10;

        if (enshow == 0 && t < (len - 1))
        {
            if (temp == 0)
            {
                LCD_ShowChar(x + (size / 2)*t, y, ' ', size, 0);
                continue;
            }
            else enshow = 1;

        }

        LCD_ShowChar(x + (size / 2)*t, y, temp + '0', size, 0);
    }
}

void LCD_ShowxNum(uint16_t x, uint16_t y, uint32_t num, uint8_t len, uint8_t size, uint8_t mode)
{
    uint8_t t, temp;
    uint8_t enshow = 0;

    for (t = 0; t < len; t++)
    {
        temp = (num / LCD_Pow(10, len - t - 1)) % 10;

        if (enshow == 0 && t < (len - 1))
        {
            if (temp == 0)
            {
                if (mode & 0X80)LCD_ShowChar(x + (size / 2)*t, y, '0', size, mode & 0X01);
                else LCD_ShowChar(x + (size / 2)*t, y, ' ', size, mode & 0X01);

                continue;
            }
            else enshow = 1;

        }

        LCD_ShowChar(x + (size / 2)*t, y, temp + '0', size, mode & 0X01);
    }
}


void LCD_ShowString(uint16_t x, uint16_t y, uint16_t width, uint16_t height, uint8_t size, uint8_t *p)
{
    uint8_t x0 = x;
    width += x;
    height += y;

    while ((*p <= '~') && (*p >= ' '))   //ÅÐ¶ÏÊÇ²»ÊÇ·Ç·¨×Ö·û!
    {
        if (x >= width)
        {
            x = x0;
            y += size;
        }

        if (y >= height)break; //ÍË³ö

        LCD_ShowChar(x, y, *p, size, 0);
        x += size / 2;
        p++;
    }
}






























