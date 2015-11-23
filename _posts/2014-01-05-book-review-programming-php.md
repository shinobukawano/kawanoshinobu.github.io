---
layout: post
title: "Book Review: Programming PHP, 3rd Edition"
categories: 
css:
---

<img src="/public/images/php.png" alt="php" width="90%" class="alignnone size-full wp-image-1344" />

<a href="http://www.php.net" target="_blank">PHP</a> is a most successful programming language for creating dynamic web pages. According to <a href="http://w3techs.com/technologies/report/pl-php" target="_blank">Web Technology Surveys</a>, PHP is used by 81.2% of all websites. Actually, this website works thanks to PHP and WordPress.

To tell you the truth, I haven't write PHP code properly. I had been working with Java, VB.NET, Python, and JavaScript. My current job is sometimes taught web programming to other people, and I always worried about what language should I use for server side programming. I like Python or Ruby (or Node.js) but these languages is not familiar to most people. PHP is a popular language for server side web programming, thus I decided to use it, and wanted to learn it properly.

I spent new year holidays with the book that teach PHP programming. That's why, I came up with to write a book review of it -- Programming PHP 3rd Edition.

<!--more-->

<h1>Introduction</h1>

Programming PHP, 3rd Edition was published on 22 February 2013, from O'Reilly Media. Author is Kevin Tatroe, Peter MacIntyre and Rasmus Lerdorf. <a href="http://en.wikipedia.org/wiki/Rasmus_Lerdorf" target="_blank">Rasmus Lerdorf</a>, he is creator of PHP! Therefore I thought this book was a most reliable book to learn PHP.

<img src="/public/images/lrg.jpg" alt="lrg" width="228" height="300" class="alignnone size-medium wp-image-1346" />

This book has organized into 17 chapters and reader will learn an overview of what's possible with PHP, language fundamentals (Data types, variables, operators, and flow control statements), Functions, Strings, Arrays, and Objects. And then reader will learn practical topics such as web application techniques, interact with relational databases (MySQL etc.), generate dynamic Images, create PDF files, parse XML files, writing secure code, error handling, performance tuning, and so on.

If you want further information, please visit O'Reilly Media's web site.

Programming PHP, 3rd Edition:
<a href="http://shop.oreilly.com/product/0636920012443.do" target="_blank">http://shop.oreilly.com/product/0636920012443.do</a>

<h1>Things I'm interested</h1>

I was totally beginner of this language, so I was especially impressed by the first part of this book. I found PHP is more powerful and flexible language than I ever thought. String, Function, OOP,, I want to introduce a couple of them.

<h3>Variable Interpolation</h3>

<pre class="prettyprint"><code class="language-php">&lt;?php
$val = "Shinobu Kawano";

echo "Hi, I'm {$val}";

// => Hi, I'm Shinobu Kawano</code>
</pre>

<h3>Here Documents</h3>

<pre class="prettyprint"><code class="language-php">&lt;?php
echo <<< EOQ

     。oＯ
  п__□  ___   ___
  [    ] [   ] [   ]
∠○--○ ○-○ ○-○

EOQ;

// =>
     。oＯ
  п__□  ___   ___
  [    ] [   ] [   ]
∠○--○ ○-○ ○-○</code>
</pre>

<h3>Default Parameters</h3>

<pre class="prettyprint"><code class="language-php">&lt;?php
function hello($arg='[anonymous]')
{
    return "My name is {$arg}\n";
}

echo hello('Shinobu');
// => My name is Shinobu

echo hello();
// => My name is [anonymous]</code>
</pre>

<h3>Anonymous Functions</h3>

<pre class="prettyprint"><code class="language-php">&lt;?php
$array = array(1, 2, 3, 4, 5);

$func  = function($a, $b)
{
    return $b - $a;
};

usort($array, $func);

print_r($array);

// =>
Array
(
    [0] => 5
    [1] => 4
    [2] => 3
    [3] => 2
    [4] => 1
)</code>
</pre>

OOP (object-oriented programming) support is great. All of the features I expect for OOP is already implemented.

- Class Definition
- Properties
- Methods
- Constants
- Access Modifiers (public, protected, private, static)
- Inheritance
- Interfaces
- Abstract Methods
- Abstract Class
- Constructors
- Destructors
- Introspection
  etc..

Plus, I learned very interesting feature of OOP, Traits. Traits provide a mechanism for reusing code outside of a class hierarchy.

Define trait,

<pre class="prettyprint"><code class="language-php">&lt;?php
trait Greed
{
    public function sayHello($name)
    {
        echo "Hello! {$name}.\n";
    }
}</code>
</pre>

then ues trait's method.

<pre class="prettyprint"><code class="language-php">&lt;?php
class Clerk
{
    use Greed;
}

$clerk = new Clerk;
$clerk->sayHello('Sota');
// => Hello! Sota.</code>
</pre>

It seems like a Sencha's mix-in. NOTE: Traits is a new feature of PHP 5.4.

<h1>Conclusion</h1>

Programming PHP, 3rd Edition is a comprehensive guidebook for learning PHP and I learned many concept of this language effectively. I appreciate to authors very much!

PHP is a "pragmatic tool", I feel indeed. Easy to learn, easy to use, simple but useful. Plus, PHP has a big community (not only engineers but also realtor, teacher, designer, musician, etc.), brilliant track records (Facebook, Tumblr, Yahoo!, and so on), popular blog engines and CMS (WordPress is my old friend!).

I think PHP is the best fit for business use. That's why PHP code has lots of $ mark :p

