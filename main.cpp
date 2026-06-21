#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main()
{
    char name[50];
    printf("请输入一个名字：\n");
    scanf("%s", name);
    int len = strlen(name);
    for (int i = 0; i < len; i++) {
        name[i] = toupper(name[i]);
    }
    printf("%s\n", name);
    return 0;
}