$c[Настройки]
    $nomention
    $textSplit[$getUserVar[GuildDuel;$authorID];-]

$c[Код+проверки]
    $if[$splitText[1]==true]
        $if[$message==yes]
            $removeComponent[GuildDuel]
            $color[F4B3CA]
            $title[Дуэль гильдий]
            $description[**Происходит дуэль, ожидание результата...**]
            $editEmbedIn[15s;Результат дуэли;$if[$random[1;4]==1] Победитель: <@$splitText[2]> ($getUserVar[GuildName;$splitText[2]]) $elseif[$random[1;4]==2] Победитель: <@$authorID> ($getUserVar[GuildName;$authorID]) $elseif[$random[1;4]==3] Ничья! $endif;$if[$or[$random[1;4]==1;$random[1;4]==2]==true] Победитель получает +15 репутации, а проигравший -5 репутации! $else Каждый получает +10 репутации! $endif;F4B3CA]

            $c[Переменные]
                $setUserVar[GuildDuel;false;$authorID]

            $async[Результат (переменные)]
                $replyIn[15s]
                    $c[Победа: 1 - тот, кто отправил вызов, 2 - тот, кто принял, 3 - ничья]
                        $if[$random[1;4]==1]
                            $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$splitText[2]];15];$splitText[2]]
                            $setUserVar[GuildReputation;$sub[$getUserVar[GuildReputation;$authorID];5];$authorID]
                        $elseif[$random[1;4]==2]
                            $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$authorID];15];$authorID]
                            $setUserVar[GuildReputation;$sub[$getUserVar[GuildReputation;$authorID];5];$authorID]
                        $elseif[$random[1;4]==3]
                            $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$splitText[2]];10];$splitText[2]]
                            $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$authorID];10];$authorID]
                        $endif
            $endasync
        $elseif[$message==no]
            $color[F4B3CA]
            $title[Дуэль гильдий]
            $description[**<@$authorID> ($getUserVar[GuildName;$authorID]) отказался от дуэли!**]

        $c[Переменные]
            $setUserVar[GuildDuel;false;$authorID]
        $endif
    $else
        $ephemeral
        $removeComponent[GuildDuel]
        $color[F4B3CA]
        $title[Упс, ошибка]
        $description[**Твою** гильдию не вызывали на дуэль!]
        $footer[Система гильдий $username[$botID]]
    $endif