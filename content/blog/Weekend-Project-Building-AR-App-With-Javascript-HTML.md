---
date: "2019-05-04"
title: "Weekend Project: Building Augmented Reality App With Javascript/HTML"
tags: ["augmented reality", "software", "js"]
---

Augmented Reality (AR) got my attention after I have seen few interesting projects on my twitter feed and I wanted to do small AR demo with using basic web development skills, just to experiment AR stuff.

_Here is the result:_

<blockquote class="twitter-tweet" data-width="350" data-lang="tr"><p lang="en" dir="ltr">Doing some AR experiment 🕺 I will publish details on my blog later <a href="https://twitter.com/hashtag/AugmentedReality?src=hash&amp;ref_src=twsrc%5Etfw">#AugmentedReality</a> <a href="https://twitter.com/hashtag/groot?src=hash&amp;ref_src=twsrc%5Etfw">#groot</a> <a href="https://t.co/WPTALpZGj9">pic.twitter.com/WPTALpZGj9</a></p>&mdash; Sezgin Ege (@SezginEge) <a href="https://twitter.com/SezginEge/status/1122202410229825537?ref_src=twsrc%5Etfw">27 Nisan 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

I have only used [a-frame](https://aframe.io/) framework and [AR.js](https://github.com/jeromeetienne/AR.js/) during development.

- **[a-frame](https://aframe.io)**: is a web framework for building virtual reality experiences.
- **[AR.js](https://github.com/jeromeetienne/AR.js)**: is a javascript framework that enabling AR features directly on web browsers without sacrificing performance. It works on any phone that supports webgl and webrtc.

## [Let`s see the code](#lets-see-the-code)

I have added comments to the code. It is pretty straightforward. Basically, we define our scene, initialize arjs, add camera and marker for origin point. Also we define the entity that we would like to show on origin point. I have used 3D groot model but you may want to show static image/box etc. In that case, you need to use a-box or a-image components.

{{< gist SezginEge e7e54a5f8a74f203e7abdeef1935344c >}}

## [How we can test this?](#how-we-can-test-this)

If you open index.html file directly on your browser and check developer console, you may see CORS issue:

`Access to XMLHttpRequest at 'file:///<workplace>/AR/test/scene.gltf' from origin 'null' has been blocked by CORS policy: Cross origin requests are only supported for protocol schemes: http, data, chrome, chrome-extension, https`

_Please have a look CORS wiki page to understand what CORS means: [https://en.wikipedia.org/wiki/Cross-origin_resource_sharing](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)_

In order to get rid of this issue, we need to run http-server. Node.js has a simple HTTP server package. To install, you need to run:

`npm install http-server -g`

After successfully command executed, we need to go to the folder that index.html exists and then start http server;

`http-server`

We should see an output like this on our terminal:

`Starting up http-server, serving ./ Available on: http://127.0.0.1:8080 http://192.168.1.36:8080`

So, server is up and running. We can click any of those addresses and open in our browser. However we will face with two issues.

- Testing AR with our browser´s webcam is not comfortable at all.
- We need to create SSL certificate for our server. Otherwise, we will see "Webcam Error NotSupportedError Only secure origins are allowed" error: https://github.com/jeromeetienne/AR.js/issues/399

To simplify this process, we can use [ngrok](https://ngrok.com/) which is reverse proxy software that establishes secure tunnels from a public endpoint such as internet to a locally running network service. We need to download and run ngrok.

`./ngrok http <port that your local server listening>`

We should see an output like this on our terminal:

`Forwarding http://e2db416e.ngrok.io -> localhost:8080`

`Forwarding https://e2db416e.ngrok.io -> localhost:808`

Now, We should be able to reach our demo with using https endpoint with any device that has internet connection.

To see our entity on screen, we should show the hiro marker to the camera. Marker can be found here: [https://jeromeetienne.github.io/AR.js/data/images/HIRO.jpg](https://jeromeetienne.github.io/AR.js/data/images/HIRO.jpg)

## [Conclusion](#conclusion)

The demo is pretty simple. However if we consider that we did this demo with few lines of html code and few JS libraries, there is a huge potential here to build greater things.

I am finishing the article with one of my favorite AR application. Enjoy!

<iframe width="100%" height="434" src="https://www.youtube.com/embed/Qi3h18wJJiI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
