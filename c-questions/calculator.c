/*
 * ============================================================
 * Project: Programming Q&A Archive
 * ============================================================
 */
/*
 * Date: 2026-06-18
 * Tags: calculator,basics,switch
 *
 * --- Question ---
 * 做一个简易计算器，用 C 语言
 *
 * --- Answer ---
 * 用 switch 分支实现 + - * / 四种运算，while 循环保持运行直到用户选择退出。
 * ============================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    int choice;
    double a, b, result;

    printf("===== 简易计算器 =====\n");

    while (1) {
        printf("\n--- 菜单 ---\n");
        printf("1. 加法 (+)\n");
        printf("2. 减法 (-)\n");
        printf("3. 乘法 (*)\n");
        printf("4. 除法 (/)\n");
        printf("0. 退出\n");
        printf("请选择 (0-4): ");
        scanf("%d", &choice);

        if (choice == 0) {
            printf("再见!\n");
            break;
        }

        if (choice < 1 || choice > 4) {
            printf("无效选择，请重试。\n");
            continue;
        }

        printf("请输入第一个数字: ");
        scanf("%lf", &a);
        printf("请输入第二个数字: ");
        scanf("%lf", &b);

        switch (choice) {
            case 1:
                result = a + b;
                printf("%.2lf + %.2lf = %.2lf\n", a, b, result);
                break;
            case 2:
                result = a - b;
                printf("%.2lf - %.2lf = %.2lf\n", a, b, result);
                break;
            case 3:
                result = a * b;
                printf("%.2lf * %.2lf = %.2lf\n", a, b, result);
                break;
            case 4:
                if (b == 0) {
                    printf("错误: 除数不能为 0!\n");
                } else {
                    result = a / b;
                    printf("%.2lf / %.2lf = %.2lf\n", a, b, result);
                }
                break;
        }
    }

    return 0;
}
