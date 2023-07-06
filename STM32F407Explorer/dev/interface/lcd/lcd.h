/**
 * @author: ALIENTEK, Modified by Wu Feiyang
 * @copyright: 广州市星翼电子科技有限公司 2014-2024 All rights reserved
 */
#ifndef LCD_H
#define LCD_H
#include "hal.h"
#include "ch.hpp"
#include "led.h"
#include <cstdio>

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef uint8_t u8;
typedef volatile uint16_t vu16;
typedef volatile uint32_t vu32;
typedef volatile uint64_t vu64;


//LCD参数
//extern lcd_dev lcddev;	//manage important lcd features
//extern u16  POINT_COLOR;//default point color red
//extern u16 BACK_COLOR; //default point color white


//////////////////////////////////////////////////////////////////////////////////
//使用NOR/SRAM的 Bank1.sector4,地址位HADDR[27,26]=11 A6作为数据命令区分线
//注意设置时STM32内部会右移一位对其! 111 1110=0X7E
#define LCD_BASE        ((vu32)(0x6C000000 | 0x0000007E))
#define LCD             ((LCD_TypeDef *) LCD_BASE)
//////////////////////////////////////////////////////////////////////////////////

//扫描方向定义
#define L2R_U2D  0 //从左到右,从上到下
#define L2R_D2U  1 //从左到右,从下到上
#define R2L_U2D  2 //从右到左,从上到下
#define R2L_D2U  3 //从右到左,从下到上

#define U2D_L2R  4 //从上到下,从左到右
#define U2D_R2L  5 //从上到下,从右到左
#define D2U_L2R  6 //从下到上,从左到右
#define D2U_R2L  7 //从下到上,从右到左

#define DFT_SCAN_DIR  L2R_U2D  //默认的扫描方向

//画笔颜色
#define WHITE         	 0xFFFF
#define BLACK         	 0x0000
#define BLUE         	 0x001F
#define BRED             0XF81F
#define GRED 			 0XFFE0
#define GBLUE			 0X07FF
#define RED           	 0xF800
#define MAGENTA       	 0xF81F
#define GREEN         	 0x07E0
#define CYAN          	 0x7FFF
#define YELLOW        	 0xFFE0
#define BROWN 			 0XBC40 //棕色
#define BRRED 			 0XFC07 //棕红色
#define GRAY  			 0X8430 //灰色
//GUI颜色

#define DARKBLUE      	 0X01CF	//深蓝色
#define LIGHTBLUE      	 0X7D7C	//浅蓝色
#define GRAYBLUE       	 0X5458 //灰蓝色
//以上三色为PANEL的颜色

#define LIGHTGREEN     	 0X841F //浅绿色
//#define LIGHTGRAY        0XEF5B //浅灰色(PANNEL)
#define LGRAY 			 0XC618 //浅灰色(PANNEL),窗体背景色

#define LGRAYBLUE        0XA651 //浅灰蓝色(中间层颜色)
#define LBBLUE           0X2B12 //浅棕蓝色(选择条目的反色)
class Lcd{
public:

//LCD重要参数集
typedef struct
{
    u16 width;			//LCD width
    u16 height;			//LCD height
    u16 id;				//LCD ID
    u8  dir;			//0，竖屏；1，横屏
    u16	wramcmd;		//begin to write gram instruction
    u16  setxcmd;		//set x coordinate command
    u16  setycmd;		//set y coordinate command
}lcd_dev_t;
    static lcd_dev_t lcddev;
private:
    //-----------------LCD端口定义----------------
//#define	LCD_LED PBout(15)  		//LCD背光    		 PB15
//LCD地址结构体
    typedef struct
    {
        vu16 LCD_REG;
        vu16 LCD_RAM;
    } LCD_TypeDef;



public:
    static void LCD_Init();             // Initilization
    static void LCD_DisplayOn();
    static void LCD_DisplayOff();													//关显示
    static void LCD_Clear(u16 Color);	 												//清屏
    static void LCD_SetCursor(u16 Xpos, u16 Ypos);										//设置光标
    static void LCD_DrawPoint(u16 x,u16 y);											//画点
    static void LCD_Fast_DrawPoint(u16 x,u16 y,u16 color);								//快速画点
    static u16  LCD_ReadPoint(u16 x,u16 y); 											//读点
    static void LCD_Draw_Circle(u16 x0,u16 y0,u8 r);						 			//画圆
    static void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2);							//画线
    static void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2);		   				//画矩形
    static void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 color);		   				//填充单色
    static void LCD_Color_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 *color);				//填充指定颜色
    static void LCD_ShowChar(u16 x,u16 y,u8 num,u8 size,u8 mode);						//显示一个字符
    static void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len,u8 size);  						//显示一个数字
    static void LCD_ShowxNum(u16 x,u16 y,u32 num,u8 len,u8 size,u8 mode);				//显示 数字
    static void LCD_ShowString(u16 x,u16 y,u16 width,u16 height,u8 size,u8 *p);		//显示一个字符串,12/16字体

    static void LCD_WriteReg(u16 LCD_Reg, u16 LCD_RegValue);
    static u16 LCD_ReadReg(u16 LCD_Reg);
    static void LCD_WriteRAM_Prepare();
    static void LCD_WriteRAM(u16 RGB_Code);
    static void LCD_SSD_BackLightSet(u8 pwm);							//SSD1963 背光控制
    static void LCD_Scan_Dir(u8 dir);									//设置屏扫描方向
    static void LCD_Display_Dir(u8 dir);								//设置屏幕显示方向
    static void LCD_Set_Window(u16 sx,u16 sy,u16 width,u16 height);	//设置窗口
//    u16 width;			//LCD width
//    u16 height;			//LCD height
//    u16 id;				//LCD ID
//    u8  dir;			//0，竖屏；1，横屏
//    u16	wramcmd;		//begin to write gram instruction
//    u16  setxcmd;		//set x coordinate command
//    u16  setycmd;		//set y coordinate command
    static u16 getLcdID()    {return lcddev.id;}
    static u16 getLcdHeight(){return lcddev.height;}
    static u16 getLcdWidth(){ return lcddev.width;}
    static u8 getLcdDir(){return lcddev.dir;}
    static u16 getWriteCmd(){return lcddev.wramcmd;}
    static u16 getLcdX(){return lcddev.setxcmd;}
    static u16 getLcdY(){return lcddev.setycmd;}

    static void setLcdID(u16 id)    {lcddev.id = id;}
    static void setLcdHeight(u16 height){lcddev.height = height;}
    static void setLcdWidth(u16 width){ lcddev.width = width;}
    static void setLcdDir(u8 dir){lcddev.dir = dir;}
    static void setLcdX(u16 x){lcddev.setxcmd = x;}
    static void setLcdY(u16 y){lcddev.setycmd = y;}
    static void setWriteCmd(u16 cmd){lcddev.wramcmd = cmd;}

private:
    static void LCD_WR_REG(vu16 regval);
    static void LCD_WR_DATA(vu16 data);
    static u16 LCD_RD_DATA();
    static u16 LCD_BGR2RGB(u16 c);
    static void opt_delay(u8 i);
    static u32 LCD_Pow(u8 m,u8 n);
public:
    class LcdThread:public chibios_rt::BaseStaticThread<512> {
        void main() final {
            setName("lcdThread");
            u8 x=0;
            u8 lcd_id[12];
            Lcd::LCD_Init();
            sprintf((char*)lcd_id,"LCD ID:%04X",Lcd::lcddev.id);

            while (!shouldTerminate()) {
                switch(x)
                {
                    case 0:Lcd::LCD_Clear(WHITE);break;
                    case 1:Lcd::LCD_Clear(BLACK);break;
                    case 2:Lcd::LCD_Clear(BLUE);break;
                    case 3:Lcd::LCD_Clear(RED);break;
                    case 4:Lcd::LCD_Clear(MAGENTA);break;
                    case 5:Lcd::LCD_Clear(GREEN);break;
                    case 6:Lcd::LCD_Clear(CYAN);break;
                    case 7:Lcd::LCD_Clear(YELLOW);break;
                    case 8:Lcd::LCD_Clear(BRRED);break;
                    case 9:Lcd::LCD_Clear(GRAY);break;
                    case 10:Lcd::LCD_Clear(LGRAY);break;
                    case 11:Lcd::LCD_Clear(BROWN);break;
                }
                Lcd::LCD_ShowString(30, 40, 210, 24, 24, (uint8_t *) "Explorer STM32F4");
                Lcd::LCD_ShowString(30, 70, 200, 16, 16, (uint8_t *) "TFTLCD TEST");
                Lcd::LCD_ShowString(30, 90, 200, 16, 16, (uint8_t *) "ZJU-UIUC Institude");
                Lcd::LCD_ShowString(30,110,200,16,16,lcd_id);
                Lcd::LCD_ShowString(30, 130, 200, 12, 12, (uint8_t *) "2023/7/5");
//                x++;
//                if(x==12)x=0;
                chThdSleepMilliseconds(5000);
            }
        }
    };

    static LcdThread lcd_thread;
};

//LCD分辨率设置
#define SSD_HOR_RESOLUTION		800		//LCD水平分辨率
#define SSD_VER_RESOLUTION		480		//LCD垂直分辨率
//LCD驱动参数设置
#define SSD_HOR_PULSE_WIDTH		1		//水平脉宽
#define SSD_HOR_BACK_PORCH		46		//水平前廊
#define SSD_HOR_FRONT_PORCH		210		//水平后廊

#define SSD_VER_PULSE_WIDTH		1		//垂直脉宽
#define SSD_VER_BACK_PORCH		23		//垂直前廊
#define SSD_VER_FRONT_PORCH		22		//垂直前廊
//如下几个参数，自动计算
#define SSD_HT	(SSD_HOR_RESOLUTION+SSD_HOR_BACK_PORCH+SSD_HOR_FRONT_PORCH)
#define SSD_HPS	(SSD_HOR_BACK_PORCH)
#define SSD_VT 	(SSD_VER_RESOLUTION+SSD_VER_BACK_PORCH+SSD_VER_FRONT_PORCH)
#define SSD_VPS (SSD_VER_BACK_PORCH)

#endif





