Feature: Users registration

    @smoke
    Scenario: User registration
        Given Customer informs registration data
            | name     | Bruno         |
            | email    | zava@test.com |
            | password | test123       |
        When I make a POST request using the account service
        Then Response code should be "200"
    
    @duplicado
    Scenario: It does not permit duplicated user
        Given Customer informs registration data
            | name     | Bruno duplicated        |
            | email    | zava@testduplicated.com |
            | password | test123                 |
        But This customer is already registered
        When I make a POST request using the account service
        Then Response code should be "409"
        And Should be displayed a JSON with the message:
        """
        O e-mail informado, ja está cadastrado!
        """
    Scenario Outline: Mandatory Fields
         Given Customer informs registration data
            | name     | <name>                  |
            | email    | <email>                 |
            | password | <password>              |
        When I make a POST request using the account service
        Then Response code should be "409"
        And Should be displayed a JSON with the message:
        """
        <message>
        """
        Examples:
        |name|email      |password |message                    |
        |     |etc@etc.com|123456  |Nome deve ser obrigatório! |
        |Bruno|           |130887  |Email deve ser obrigatório!|
        |Bruno|etc@etc.com|        |Senha deve ser obrigatório!|
    
       