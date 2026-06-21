#include <stdio.h>
#include <string.h>

int main()
{
    char name[50], NAME[50];
    printf("请输入一个名字：\n");
    scanf("%s", name);
    int len = strlen(name);
    for (int i = 0; i < len; i++) {
        if (name[i] >= 'A' && name[i] <= 'Z') {
            NAME[i] = name[i] + 32;       /* 大写 → 小写 */
        } else if (name[i] >= 'a' && name[i] <= 'z') {
            NAME[i] = name[i] - 32;       /* 小写 → 大写 */
        } else {
            NAME[i] = name[i];            /* 其他字符不变 */
        }
    }
    NAME[len] = '\0';                    /* 结尾加 \0 */
    printf("%s\n", NAME);
    return 0;
}