programa
{
    funcao inicio()
    {
        inteiro senha[4], tentativa[4], certo_posicao, certo_errado, i, j, tentativas
        logico usadoSenha[4], usadoTentativa[4], valido

        tentativas <- 0
        
        // Gerar senha aleatória única
        para (i <- 0; i < 4; i++)
        {
            repita
            {
                senha[i] <- inteiro(rand() * 10) // Número entre 0 e 9
                valido <- verdadeiro

                // Garantir que não há números repetidos
                para (j <- 0; j < i; j++)
                {
                    se (senha[i] == senha[j]) entao
                    {
                        valido <- falso
                    }
                }
            } enquanto (nao valido)
        }

        escreval("Bem-vindo ao Desafio do Código Secreto!")
        escreval("Tente adivinhar a senha de 4 dígitos. Cada número é único.")

        // Loop principal do jogo
        repita
        {
            certo_posicao <- 0
            certo_errado <- 0
            tentativas <- tentativas + 1

            // Resetar marcadores
            para (i <- 0; i < 4; i++)
            {
                usadoSenha[i] <- falso
                usadoTentativa[i] <- falso
            }

            // Capturar entrada válida do usuário
            repita
            {
                escreva("Digite quatro números distintos: ")
                leia(tentativa[0], tentativa[1], tentativa[2], tentativa[3])

                valido <- verdadeiro

                // Verificar se são números distintos
                para (i <- 0; i < 4; i++)
                {
                    para (j <- i + 1; j < 4; j++)
                    {
                        se (tentativa[i] == tentativa[j]) entao
                        {
                            valido <- falso
                        }
                    }
                }

                se (nao valido) entao
                {
                    escreval("Erro: Os números devem ser diferentes! Tente novamente.")
                }
            } enquanto (nao valido)

            // Comparar posição correta
            para (i <- 0; i < 4; i++)
            {
                se (tentativa[i] == senha[i]) entao
                {
                    certo_posicao <- certo_posicao + 1
                    usadoSenha[i] <- verdadeiro
                    usadoTentativa[i] <- verdadeiro
                }
            }

            // Comparar números certos, mas em posições erradas
            para (i <- 0; i < 4; i++)
            {
                se (nao usadoTentativa[i]) entao
                {
                    para (j <- 0; j < 4; j++)
                    {
                        se ((tentativa[i] == senha[j]) e (nao usadoSenha[j])) entao
                        {
                            certo_errado <- certo_errado + 1
                            usadoSenha[j] <- verdadeiro
                            saia
                        }
                    }
                }
            }

            // Exibir dicas ao usuário
            escreval("Tentativa #", tentativas)
            escreval("✔ Números certos na posição correta: ", certo_posicao)
            escreval("❌ Números certos na posição errada: ", certo_errado)
            escreval("------------------------------")

        } enquanto (certo_posicao < 4)

        escreval("🎉 Parabéns! Você descobriu a senha em ", tentativas, " tentativas.")