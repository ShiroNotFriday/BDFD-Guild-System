$c[Настройки]
    $nomention
    $textSplit[$getUserVar[GuildInvite;$authorID];-]

$c[Код+проверки]
    $if[$splitText[1]==true]
        $if[$message==yes]
            $removeComponent[GuildInvite]
                $color[F4B3CA]
                $title[Приглашение в гильдию]
                $description[**<@$authorID>** принял приглашение в гильдию $getUserVar[GuildName;$splitText[2]]!
                $if[$getUserVar[FirstGuild;$authorID]==true] Поскольку это его первая выбранная гильдия, гильдия $getUserVar[GuildName;$splitText[2]] получает 15 репутации! $endif
                ]
                $footer[В этой гильдии теперь $sum[$getUserVar[GuildMembers;$splitText[2]];1] участников!]
            
                $c[Переменные]
                    $setUserVar[Guild;true;$authorID]
                    $setUserVar[GuildName;$getUserVar[GuildName;$splitText[2]];$authorID]
                    $setUserVar[GuildOwnerID;$splitText[2];$authorID]
                    $setUserVar[GuildMembers;$sum[$getUserVar[GuildMembers;$splitText[2]];1];$splitText[2]]
                    $if[$getUserVar[FirstGuild;$authorID]==true]
                        $setUserVar[FirstGuild;false;$authorID]
                        $setUserVar[GuildReputation;$sum[$getUserVar[GuildReputation;$splitText[2]];15];$splitText[2]]
                    $endif
                    $setUserVar[GuildInvite;false;$authorID]
        $elseif[$message==no]
            $removeComponent[GuildInvite]
                $color[F4B3CA]
                $title[Приглашение в гильдию]
                $description[**<@$authorID>** отказался от вступления в гильдию $getUserVar[GuildName;$splitText[2]]!]
            
                $c[Переменные]
                    $setUserVar[GuildInvite;false;$authorID]
        $endif
    $else
        $ephemeral
            $removeComponent[GuildInvite]
                $color[F4B3CA]
                $title[Приглашение в гильдию]
                $description[**<@$authorID>** у тебя нет приглашения в гильдию или срок действия приглашения истёк!]
    $endif