#include <gpio.h>

#define PIN_AMOUNT 0x20 //32
#define MIDDLE_PIN 0x10 //16

int i;
bool next_en;
int irq_type;

void ISR_GPIO (){ 
    if ((irq_type == GPIO_IRQ_LEV0) | (irq_type == GPIO_IRQ_FALL)) set_gpio_pin_value(i, 0x1);
    else set_gpio_pin_value(i, 0x0);
    get_gpio_irq_status();
    next_en = true;
}

void test_atomic(int in_begin, int out_begin, int irq_type){
    for (i = out_begin; i < (out_begin + MIDDLE_PIN); i++){
        set_gpio_pin_direction(i, DIR_OUT);
        if ((irq_type == GPIO_IRQ_LEV0) | (irq_type == GPIO_IRQ_FALL)) set_gpio_pin_value(i, 0x1);
        else set_gpio_pin_value(i, 0x0);
    }

    for (i = in_begin; i < (in_begin + MIDDLE_PIN); i++){
        set_gpio_pin_direction(i, DIR_IN);
        set_gpio_pin_irq_en(i, 0x1);
        set_gpio_pin_irq_type(i, irq_type);
    }

    for (i = out_begin; i < (out_begin + MIDDLE_PIN); i++){
        next_en = false;
        if ((irq_type == GPIO_IRQ_LEV0) | (irq_type == GPIO_IRQ_FALL)) set_gpio_pin_value(i, 0x0);
        else set_gpio_pin_value(i, 0x1);
        while (!next_en){/* поставить время чуть большее чем в vip чтоб можно было дальше отлавливать баги*/};
    }

    for (i = in_begin; i < (in_begin + MIDDLE_PIN); i++) set_gpio_pin_irq_en(i, 0x0);
}

int main(){

    int data;

    for (i = 0; i < PIN_AMOUNT; i++){
        set_pin_function(i, FUNC_GPIO);
    }

    //------------------------------------------Проверка без прерываний------------------------------------------
    for (i = 0; i < PIN_AMOUNT; i = i + 2){
        set_gpio_pin_direction(i, DIR_IN);
        set_gpio_pin_direction(i + 1, DIR_OUT);
    }

    for (i = 0; i < PIN_AMOUNT; i = i + 2){
        data = !get_gpio_pin_value(i);
        set_gpio_pin_value(i + 1, data);
    }

    for (i = 0; i < PIN_AMOUNT; i = i + 2){
        set_gpio_pin_direction(i, DIR_OUT);
        set_gpio_pin_direction(i + 1, DIR_IN);
    }

    for (i = 1; i < PIN_AMOUNT; i = i + 2){
        data = !get_gpio_pin_value(i);
        set_gpio_pin_value(i - 1, data);
    }
    //-----------------------------------------------------------------------------------------------------------

    //------------------------------------Проверка с прерываниями типа "уровень 0"-------------------------------
    irq_type = GPIO_IRQ_LEV0;

    test_atomic(0, MIDDLE_PIN, GPIO_IRQ_LEV0);

    test_atomic(MIDDLE_PIN, 0, GPIO_IRQ_LEV0); 
    //-----------------------------------------------------------------------------------------------------------

    //------------------------------------Проверка с прерываниями типа "уровень 1"-------------------------------
    irq_type = GPIO_IRQ_LEV1;

    test_atomic(0, MIDDLE_PIN, GPIO_IRQ_LEV1);

    test_atomic(MIDDLE_PIN, 0, GPIO_IRQ_LEV1); 
    //-----------------------------------------------------------------------------------------------------------

    //------------------------------------Проверка с прерываниями типа "fall edge"-------------------------------
    irq_type = GPIO_IRQ_FALL;

    test_atomic(0, MIDDLE_PIN, GPIO_IRQ_FALL);

    test_atomic(MIDDLE_PIN, 0, GPIO_IRQ_FALL); 
    //-----------------------------------------------------------------------------------------------------------

    //------------------------------------Проверка с прерываниями типа "rise edge"-------------------------------
    irq_type = GPIO_IRQ_RISE;

    test_atomic(0, MIDDLE_PIN, GPIO_IRQ_RISE);

    test_atomic(MIDDLE_PIN, 0, GPIO_IRQ_RISE); 
    //-----------------------------------------------------------------------------------------------------------


	return 0;
}