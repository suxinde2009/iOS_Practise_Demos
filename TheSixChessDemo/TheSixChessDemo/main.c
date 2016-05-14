//
//  main.c
//  TheSixChessDemo
//
//  Created by suxinde on 16/5/14.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#include <stdio.h>
#include "head.h"

/*
 theSixChess
 小的时候玩过的一款以三国志为主题的游戏，用掷色子的方式，在1-6的数据中选出一个数据来比大小，攻城掠地的游戏。
 */

int main(int argc, const char * argv[]) {
    // insert code here...
    int i, playRound, moveStep;
    char choice;
    int *dot;
    
    srand(time(NULL));											/* 随机数生成*/
    show_message();
    
    for(playRound = 1; ;)
    {
        dot = calloc(MAX_PLAYER, sizeof(int));
        for(i = 0; ; ++i)
        {
            moveStep = f__move();
            printf("Player want to move %d\n", moveStep);
            
            dot[i % MAX_PLAYER] += moveStep;
            printf("Player %d is now %d\n", i % MAX_PLAYER + 1, dot[i % MAX_PLAYER]);
            if(dot[i % MAX_PLAYER] >= 60)
            {
                printf("%s%d\n", "YOU WIN! Congratulations PLAYER ", i % MAX_PLAYER + 1);
                break;
            }
        }
        printf("%s%d%s", "Round ", playRound," is over, do you want to next round?(Y/N)");
        scanf("%c", &choice);
        switch(choice)
        {
            case 'Y':
                continue;
            case 'N':
                printf("Bye\n");
                exit(0);
            default:
                printf("Your choice is unbelievbable!!\n");
                exit(0);
        }
    }
    
    return 0;

}
