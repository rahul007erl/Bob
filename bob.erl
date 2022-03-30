-module(bob).
-export([start/0]).


% checking for UpperCase -----------------
% Using ASCII values to check a char is alphabet or special Char
% ASCII Range 65 - 90 --> A - Z
%% ASCII Range 97 - 122 --> a - z

isUpperCase("") -> true;

isUpperCase([H|T]) when (H >= 65 andalso H =< 90) or (H >= 97 andalso H =< 122) ->

  case H of
    H when H >= 65,H =< 90 ->
       isUpperCase(T);
    _ ->
       false
  end;

isUpperCase([_H|T]) ->
  isUpperCase(T).

%% ------------------------------------

speak("") -> "Fine. Be that way!";

speak(Input) ->
  case Input of
    "How are you?" -> "Sure.";
     Input  ->
	 Len = length(Input),
	 LastChar = string:slice(Input, Len - 1, Len),
	 IsUpper  = isUpperCase(Input),
	 case {IsUpper, LastChar} of
             {true, "?"} -> "Calm down, I know what I'm doing!";
	     {true, _}   -> "Whoa, chill out!";

             _           -> "Whatever."
	 end
  end.

%% -------------------------------------------------

start() ->
  io:format("~n ~p ~n", [speak("")]),
  io:format("~n ~p ~n", [speak("Hi Bob")]),
  io:format("~n ~p ~n", [speak("How are you?")]),
  io:format("~n ~p ~n", [speak("HOW ARE YOU?")]),
  io:format("~n ~p ~n ",[speak("HOW ARE YOU!")]),
  io:format("~n ~p ~n", [speak("What's up?")]),
  io:format("~n ~p ~n", [speak("Byeee!!!!")]).
