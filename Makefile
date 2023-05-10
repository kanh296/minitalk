# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nghoang <nghoang@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/11 01:55:10 by nghoang           #+#    #+#              #
#    Updated: 2023/05/11 02:46:11 by nghoang          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = ft_server.c ft_client.c
OBJECTS = $(SOURCES:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: server client

bonus: server client

server: ft_server.o libft
	$(CC) -o $@ $< -Llibft -lft

client: ft_client.o libft
	$(CC) -o $@ $< -Llibft -lft

%.o: %.c
	$(CC) -c $(CFLAGS) $?

libft:
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean

fclean: clean
	rm -f ft_server ft_client libft/libft.a

re: fclean all

.PHONY: all bonus libft clean fclean re
