---
layout: default
---

Squib is a Ruby [DSL](http://en.wikipedia.org/wiki/Domain-specific_language) for prototyping card and board games. Write a little bit of Ruby, define your deck's stats, then compile your game into a series of images ready for print-and-play or even print-on-demand. Squib is very data-driven and built on the principle of Don't Repeat Yourself. Think of it like [nanDeck](http://www.nand.it/nandeck/) done "the Ruby way". Squib supports:

  * A concise set of rules for laying out your cards
  * Loading PNGs and SVGs
  * Complex text rendering using [Pango](http://www.pango.org/)
  * Reading `xlsx` and `csv` files
  * Rendering to PNGs, PDFs, and SVGs (sheets or individual files)
  * Flexible, data-driven layouts in Yaml
  * Basic shape drawing, blending operators, gradients, etc.
  * Unit conversion
  * The full power of Ruby!

Squib is based on the [Cairo](http://cairographics.org/) graphics rendering engine, the library of choice for WebKit, Gecko, Inkscape and many, many others.

## Check this out.

<div class="highlight highlight-ruby">
{% highlight ruby %}
{% include_relative squib_examples/basic.rb %}
{% endhighlight %}
</div>

<div class="downarrow"></div>

<div class="example">
  <img src="/squib/squib_examples/_output/basic_0.png">
  <img src="/squib/squib_examples/_output/basic_1.png">
</div>

<hr/>

## Perhaps something a little prettier...

<div class="highlight highlight-ruby">
{% highlight ruby %}
{% include_relative squib_examples/better.rb %}
{% endhighlight %}
</div>

<div class="downarrow"></div>

<div class="example">
  <img src="/squib/squib_examples/_output/better_0.png">
  <img src="/squib/squib_examples/_output/better_1.png">
</div>

<hr/>

##Let's go bigger.

Suppose we have an excel sheet like this:

| Title | Attack | Defend |
|-------|--------|--------|
| Sword | 5 | 4 |
| Dagger | 3 | 3 |
| Axe | 8 | 1 |
| Shield | 1 | 8 |

And a `layout.yml` file like this:
<div class="highlight highlight-ruby">
{% highlight yaml %}
{% include_relative squib_examples/layout.yml %}
{% endhighlight %}
</div>

And then this `deck.rb` file:
<div class="highlight highlight-ruby">
{% highlight ruby %}
{% include_relative squib_examples/bigger.rb %}
{% endhighlight %}
</div>

<div class="downarrow"></div>

<div class="example">
  <img src="/squib/squib_examples/_output/bigger_0.png">
  <img src="/squib/squib_examples/_output/bigger_1.png">
  <img src="/squib/squib_examples/_output/bigger_2.png">
  <img src="/squib/squib_examples/_output/bigger_3.png">
</div>

<hr/>

## Even Bigger...
Ok that was cool, but let's go bigger. This example uses our built-in layout called `hand.yml` as a base template (found [here](https://github.com/andymeneely/squib/blob/master/lib/squib/layouts/hand.yml)).

| Title | Attack | Defend | Health | Description          | Snark | Art |
|-------|--------|--------|--------|----------------------|-------|-----|
| Sword | 5 | 4 | 3 | You may draw 1 card. |  My father always told me that the sword is more bargaining chip than weapon. | broadsword.svg |
| Daggers | 3 | 3 | 1 | If your opponent attacks, you may counter +1 Damage | Darkness is my cloak. | daggers.svg |
| Battle Axe | 8 | 1 | 3 | Cannot be used against Dwarves. | You might see me coming, but you can't stop me. | battle-axe.svg |
| Wooden Shield | 1 | 8 | 2 | Breaks apart against an attack of 5 or more. | This will have to do for now. | round-shield.svg |

And a `layout.yml` file like this:
<div class="highlight highlight-ruby">
{% highlight yaml %}
{% include_relative squib_examples/even-bigger.yml %}
{% endhighlight %}
</div>

And then this `deck.rb` file:
<div class="highlight highlight-ruby">
{% highlight ruby %}
{% include_relative squib_examples/even-bigger.rb %}
{% endhighlight %}
</div>


<div class="downarrow"></div>

<div class="example">
  <img src="/squib/squib_examples/_output/even_bigger_0.png">
  <img src="/squib/squib_examples/_output/even_bigger_1.png">
  <img src="/squib/squib_examples/_output/even_bigger_2.png">
  <img src="/squib/squib_examples/_output/even_bigger_3.png">
</div>

<div>
  <img src="/squib/squib_examples/_output/showcase.png">
</div>
<div>
  <img src="/squib/squib_examples/_output/hand.png">
</div>

<hr/>

Ready to [get started](http://squib.readthedocs.org)?

The above examples can be found [here](https://github.com/andymeneely/squib/tree/gh-pages/squib_examples).

NOTE: The final example, in particular, is intended to showcase the expressive power of Ruby+Squib. If you are new to Ruby (or to programming entirely), I don't recommend starting by dissecting the above example. Instead, head over to the [docs](http://squib.readthedocs.org), and playing with our exhaustive [samples](https://github.com/andymeneely/squib/tree/master/samples), and keep referring back to the [method-by-method documentation](http://squib.readthedocs.org/en/latest/dsl/index.html) for details.
