# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mel-yous <mel-yous@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/04 22:34:17 by mel-yous          #+#    #+#              #
#    Updated: 2023/02/02 16:06:17 by mel-yous         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = so_long
SRCS = drawer.c engine.c helper_func.c map_checker.c map_reader.c \
       mlx_func.c so_long.c solong_utils.c valid_path.c

OBJS = $(SRCS:.c=.o)
COMPILER = cc
CFLAGS = -Wall -Werror -Wextra

all: extern $(NAME)

bonus: extern
	make -C bonus_src/

extern:
	make -C libft/
	make -C ft_printf/
	make -C get_next_line/

$(NAME): $(OBJS)
	$(COMPILER) -o $(NAME) $(OBJS) \
	libft/libft.a ft_printf/libftprintf.a \
	get_next_line/libft_getnextline.a \
	-lmlx -framework OpenGL -framework AppKit

%.o: %.c so_long.h
	$(COMPILER) $(CFLAGS) -c $<

clean:
	make clean -C libft/
	make clean -C ft_printf/
	make clean -C get_next_line/
	make clean -C bonus_src/
	rm -rf $(OBJS)

fclean: clean
	rm -rf libft/libft.a
	rm -rf ft_printf/libftprintf.a
	rm -rf get_next_line/libft_getnextline.a
	rm -rf $(NAME)
	rm -rf bonus_src/$(NAME)

re: fclean all

.PHONY: all extern clean fclean re