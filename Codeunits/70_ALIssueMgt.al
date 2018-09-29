codeunit 123456770 "Download AL Issues"
{
    trigger OnRun();
    begin
        ALIssue.DeleteAll;
        // Simple web service call 
        HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not HttpClient.Get('https://api.github.com/repos/Microsoft/AL/issues', ResponseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\\' + 'Status code: %1\' + 'Description: %2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase);
        ResponseMessage.Content.ReadAs(JsonText);
        // Process JSON response 
        if not JsonArray.ReadFrom(JsonText) then
            Error('Invalid response, expected an JSON array as root object');
        foreach jsonToken in JsonArray do
        begin
            JsonObject := JsonToken.AsObject;
            ALIssue.init;
            if not JsonObject.Get('id', JsonToken) then
                error('Could not find a token with key %1');
            ALIssue.id := JsonToken.AsValue.AsInteger;
            ALIssue.number := GetJsonToken(JsonObject, 'number').AsValue.AsInteger;
            ALIssue.title := GetJsonToken(JsonObject, 'title').AsValue.AsText;
            ALIssue.created_at := GetJsonToken(JsonObject, 'created_at').AsValue.AsDateTime;
            ALIssue.state := GetJsonToken(JsonObject, 'state').AsValue.AsText;
            ALIssue.html_url := GetJsonToken(JsonObject, 'html_url').AsValue.AsText; ALIssue.Insert;

            ALIssue.user := SelectJsonToken(JsonObject, '$.user.login').AsValue.AsText;
            if ALIssue.Insert then;
        end;
    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('Could not find a token with path %1', Path);
    end;

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    var

    var
        ALIssue: Record ALIssue;
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonText: text;
        i: Integer;
}