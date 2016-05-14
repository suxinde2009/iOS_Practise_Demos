//
//  head.c
//  TheSixChessDemo
//
//  Created by suxinde on 16/5/14.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#include <stdio.h>

void show_message()
{
    printf("%s\n",
           "我在小的时候玩过一款很好玩的桌游\n"
           "类似强手棋，但是追加武将战斗系统\n"
           "每个三国武将都有6个属性\n"
           "统帅 武力 智力 政治 道德 魅力\n"
           "用掷色子的方式决定双方武将比较哪一个属性\n"
           "属性值大的一方获胜\n"
           "如今我想用C语言重新设计出这个游戏\n"
           "当然加入我个人的一些想法，已经不是原先的那款游戏了\n"
           );
}

int f__move(void)
{
    int result;
    
    result = rand() % 6;
    
    return result;
}
