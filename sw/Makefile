CC = gcc

SRC_DIR	= src
OBJ_DIR	= obj

SRC	= driver_kuznechik
OBJ = $(addprefix $(OBJ_DIR)/,$(SRC:=.o))

HEADERS =	headers/kuznechik_dr.h	\
			headers/pulpino.h
			
NAME = driver.a

.PHONY: all clean fclean re

all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $< -c -o $@

$(OBJ_DIR):
	mkdir -p $@

$(NAME): $(OBJ) $(HEADERS)
	ar rc $@ $<
	ranlib $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all
