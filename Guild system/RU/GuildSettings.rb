$c[Настройки]
    $nomention
    $var[Setting;$toLowercase[$message[1]]]
    $var[Description;$replaceText[$message;$var[Setting] ;;-1]]

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$getUserVar[Guild;$authorID]==true;**Ты** не состоишь в какой-либо гильдии!]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==true;**Ты** не владелец гильдии!]
    $onlyIf[$or[$var[Setting]==описание;$var[Setting]==приватность]==true;Указанной настройки не найдено! Доступные: `описание <значение>`, `приватность`.]

$if[$var[Setting]==описание]
    $onlyIf[$argCount[$var[Description]]<=190;Описание гильдии должно быть не больше 190 символов (у **тебя** $argCount[$var[Description]], пробелы учитываются)!]
        $color[F4B3CA]
        $title[Настройки гильдии]
        $description[**Описание гильдии обновлено!**]
        $addField[Было:;$if[$getUserVar[GuildDescription;$authorID]==false] Не указано $else $getUserVar[GuildDescription;$authorID] $endif]
        $addField[Стало:;$var[Description]]
        
        $c[Переменные]
            $setUserVar[GuildDescription;$var[Description]]
$elseif[$var[Setting]==приватность]
    $if[$getUserVar[GuildPrivate;$authorID]==false]
        $color[F4B3CA]
        $title[Настройки гильдии]
        $description[**Приватность гильдии обновлена!**]
        $addField[Было:; публичная]
        $addField[Стало:; приватная]
        $footer[Теперь вступление в гильдию только по приглашению!]
        
        $c[Переменные]
            $setUserVar[GuildPrivate;true;$authorID]
    $elseif[$getUserVar[GuildPrivate;$authorID]==true]
        $color[F4B3CA]
        $title[Настройки гильдии]
        $description[**Приватность гильдии обновлена!**]
        $addField[Было:; приватная]
        $addField[Стало:; публичная]
        $footer[Теперь каждый может вступить в гильдию!]
        
        $c[Переменные]
            $setUserVar[GuildPrivate;false;$authorID]
    $endif
$endif
