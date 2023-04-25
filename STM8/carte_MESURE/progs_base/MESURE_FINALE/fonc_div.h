//prototype fonctions 
//control_1
void init_SPI(void);

void init_ADC(void);

void init_Poussoirs(void);

void init_LED(void);

void affiche_mot(uint8_t *mot, uint8_t col, uint8_t ligne);

void affiche_nombre(uint16_t nombre, uint8_t col, uint8_t ligne);

//control_2
void init_timer1_2ms(void);

void init_UART2(uint16_t UART_BAUDRATE);

void write_byte_UART2(uint8_t data);

void init_timer2_pwm(void);

//control_4
uint16_t read_AD7991(uint8_t octet_conf);




//control_f
void lettre_couleur(void);
