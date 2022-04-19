$c[Настройки]
    $nomention

$c[Проверки]
    $embedSuppressErrors[Упс, ошибка;;F4B3CA;;Система гильдий $username[$botID];]
    $onlyIf[$getUserVar[GuildOwner;$authorID]==false;**Ты** уже владеешь гильдией!]
    $onlyIf[$getUserVar[Guild;$authorID]==false;**Ты** уже состоишь в гильдии!]
    $argsCheck[>1;Должно быть 1 и более аргументов!]
    $onlyIf[$argCount[$message]<=25;Название гильдии должно быть не больше 25 символов (у **тебя** $argCount[$message], пробелы учитываются)!]

$color[F4B3CA]
$title[Гильдия основана]
$description[
**Название**: $message
**Владелец**: <@$authorID>
**Описание**: `(задайте его при помощи команды !settings)`
]

$c[Переменные]
    $setUserVar[Guild;true;$authorID]
    $setUserVar[GuildOwner;true;$authorID]
    $setUserVar[GuildOwnerID;$authorID;$authorID]
    $setUserVar[GuildName;$message;$authorID]
    $setUserVar[GuildMembers;1;$authorID]