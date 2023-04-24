## https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/#:~:text=To%20remove%20one%20or%20more,containers%20you%20want%20to%20remove.&text=If%20you%20get%20an%20error,the%20container%20before%20removing%20it.

<div class="markdown">
        <p><span id="ezoic-pub-ad-placeholder-167" class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 box-2 box-2167 adtester-container adtester-container-167"
                        data-ez-name="linuxize_com-box-2"><span id="div-gpt-ad-linuxize_com-box-2-0" ezaw="728"
                                ezah="90"
                                style="position:relative;z-index:0;display:inline-block;padding:0;min-height:90px;min-width:728px;"
                                class="ezoic-ad ezfound">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[728, 90], 'linuxize_com-box-2', 'ezslot_13', 167, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-box-2-0');</script>
                                <div id="google_ads_iframe_/21732118914,21786717481/linuxize_com-box-2_0__container__"
                                        style="border: 0pt none; width: 728px; height: 0px;"></div>
                        </span></span>Docker is an open-source containerization platform that allows you to quickly
                build, test, and deploy applications as portable containers that can run virtually anywhere.</p><span
                class="ezoic-autoinsert-video ezoic-under_first_paragraph">
                <div id="ez-video-wrap-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                        class="ez-video-wrap" style="align-self: stretch; display: none !important;">
                        <div style="max-width:640px;" class="ez-video-center">
                                <div id="floating-placeholder-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                        class="floating-placeholder" style="display: none;">
                                        <div id="floating-placeholder-sizer-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                                class="floating-placeholder-sizer"></div>
                                </div>
                                <div id="ez-video-container-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                        class="ez-video-container ez-float-right" style="flex-wrap: wrap;">
                                        <div class="ez-video-ez-stuck-bar" id="ez-video-ez-stuck-bar">
                                                <div class="ez-video-ez-stuck-title"
                                                        id="ez-video-stuck-title-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8">
                                                        How To Manage &amp; Free Up Storage...</div>
                                                <div class="ez-video-ez-stuck-close vjs-icon-cancel"
                                                        id="ez-video-ez-stuck-close"
                                                        onclick="document.getElementById('ezmobfooter').style.display='none';">
                                                        <span class="vjs-icon-placeholder"></span></div>
                                        </div><video
                                                id="ez-video-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                                class="video-js vjs-16-9 ez-vid-placeholder" controls=""
                                                preload="metadata">
                                                <p class="vjs-no-js">Please enable JavaScript</p>
                                        </video>
                                        <div id="lds-ring-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                                class="lds-ring">
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                                <div></div>
                                        </div>
                                        <div id="ez-video-links-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                                style="position:absolute;"></div>
                                </div><a id="ez-video-link-d1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                        class="ez-video-link"
                                        href="https://humix.com/redirect?url=https%3A%2F%2Ftechy.how%2Fhumix%2Fvideo%2Fd1adedaa144c8c9efd047a40165528b2b056c27fb2137dc0e18a374f61caa0c8"
                                        target="_self">How To Manage &amp; Free Up Storage on Mac OS Ventura</a>
                        </div>
                </div>
        </span><!-- ezoic_video_placeholder-under_first_paragraph-640x360-999998-clearholder --><!-- ezoic_video_placeholder-under_first_paragraph-640x360-999998-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-under_first_paragraph-426x240-999998-clearholder --><!-- ezoic_video_placeholder-under_first_paragraph-426x240-999998-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-under_first_paragraph-384x216-999998-clearholder --><!-- ezoic_video_placeholder-under_first_paragraph-384x216-999998-nonexxxclearxxxblock -->
        <p>When working with Docker, you can quickly accumulate a large number of unused objects that consume
                significant disk space and clutter the output produced by the Docker commands. Docker doesn’t remove
                unused objects such as containers, images, volumes, and networks unless you explicitly tell it to do
                so.<span id="ezoic-pub-ad-placeholder-158" class="ezoic-adpicker-ad"></span></p>
        <p>This article serves as a “cheat sheet” to help Docker users keep their system organized and free disk space
                by removing unused Docker containers, images, volumes, and networks.<span
                        id="ezoic-pub-ad-placeholder-138" class="ezoic-adpicker-ad"></span></p>
        <h2 id="removing-all-unused-docker-objects" class="h-is-visible h-is-active h-is-highlight">Removing All Unused
                Docker Objects <a class="headline-link" href="#removing-all-unused-docker-objects"
                        aria-hidden="true">#</a></h2>
        <p>The <code>docker system prune</code> command removes all stopped containers, dangling images, and unused
                networks:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker system prune</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>You’ll be prompt you to confirm the operation:<span id="ezoic-pub-ad-placeholder-139"
                        class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 box-3 box-3139 adtester-container adtester-container-139"
                        data-ez-name="linuxize_com-box-3"><span id="div-gpt-ad-linuxize_com-box-3-0" ezaw="728"
                                ezah="90"
                                style="position:relative;z-index:0;display:inline-block;padding:0;min-height:90px;min-width:728px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[728, 90], 'linuxize_com-box-3', 'ezslot_5', 139, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-box-3-0');</script>
                        </span></span></p><span
                class="ezoic-autoinsert-video ezoic-under_second_paragraph"></span><!-- ezoic_video_placeholder-under_second_paragraph-640x360-999997-clearholder --><!-- ezoic_video_placeholder-under_second_paragraph-640x360-999997-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-under_second_paragraph-426x240-999997-clearholder --><!-- ezoic_video_placeholder-under_second_paragraph-426x240-999997-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-under_second_paragraph-384x216-999997-clearholder --><!-- ezoic_video_placeholder-under_second_paragraph-384x216-999997-nonexxxclearxxxblock -->
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N]
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Use the <code>-f</code> (<code>--force</code>) option to bypass the prompt.<span
                        id="ezoic-pub-ad-placeholder-156" class="ezoic-adpicker-ad"></span></p>
        <p><span id="ezoic-pub-ad-placeholder-159" class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 medrectangle-3 medrectangle-3159 adtester-container adtester-container-159"
                        data-ez-name="linuxize_com-medrectangle-3"><span id="div-gpt-ad-linuxize_com-medrectangle-3-0"
                                ezaw="728" ezah="90"
                                style="position:relative;z-index:0;display:inline-block;padding:0;min-height:90px;min-width:728px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[728, 90], 'linuxize_com-medrectangle-3', 'ezslot_4', 159, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-medrectangle-3-0');</script>
                        </span></span>If you want to remove all unused images not just the dangling ones, add the
                <code>-a</code> (<code>--all</code>) option to the command:<span id="ezoic-pub-ad-placeholder-140"
                        class="ezoic-adpicker-ad"></span></p><span
                class="ezoic-autoinsert-video ezoic-mid_content"></span><!-- ezoic_video_placeholder-mid_content-640x360-999996-clearholder --><!-- ezoic_video_placeholder-mid_content-640x360-999996-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-mid_content-426x240-999996-clearholder --><!-- ezoic_video_placeholder-mid_content-426x240-999996-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-mid_content-384x216-999996-clearholder --><!-- ezoic_video_placeholder-mid_content-384x216-999996-nonexxxclearxxxblock -->
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker system prune -a</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all images without at least one container associated to them
        - all build cache
Are you sure you want to continue? [y/N]
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>By default, the command doesn’t remove unused volumes to prevent losing important data. To remove all unused
                volumes, pass the <code>--volumes</code> option:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker system prune --volumes</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h2 id="removing-docker-containers">Removing Docker Containers <a class="headline-link"
                        href="#removing-docker-containers" aria-hidden="true">#</a></h2>
        <p>Docker containers are not automatically removed when you stop them unless you start the container using the
                <code>--rm</code> flag.</p><span
                class="ezoic-autoinsert-video ezoic-long_content"></span><!-- ezoic_video_placeholder-long_content-640x360-999995-clearholder --><!-- ezoic_video_placeholder-long_content-640x360-999995-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-long_content-426x240-999995-clearholder --><!-- ezoic_video_placeholder-long_content-426x240-999995-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-long_content-384x216-999995-clearholder --><!-- ezoic_video_placeholder-long_content-384x216-999995-nonexxxclearxxxblock -->
        <h3 id="removing-one-or-more-containers">Removing one or more containers <a class="headline-link"
                        href="#removing-one-or-more-containers" aria-hidden="true">#</a></h3>
        <p>To remove one or more Docker containers, use the <code>docker container rm</code> command, followed by the
                IDs of the containers you want to remove.</p>
        <p>You can get a <a href="https://linuxize.com/post/how-to-list-docker-containers/">list of all containers</a>
                by invoking the <code>docker container ls</code> command with the <code>-a</code> option:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container ls -a</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>The output should look something like this:<span id="ezoic-pub-ad-placeholder-142"
                        class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 medrectangle-4 medrectangle-4142 adtester-container adtester-container-142"
                        data-ez-name="linuxize_com-medrectangle-4"><span id="div-gpt-ad-linuxize_com-medrectangle-4-0"
                                ezaw="336" ezah="280"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:280px;min-width:336px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[336, 280], 'linuxize_com-medrectangle-4', 'ezslot_6', 142, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-medrectangle-4-0');</script>
                        </span></span></p>
        <pre tabindex="0"><code class="language-output" data-lang="output">CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS                      PORTS               NAMES
cc3f2ff51cab        centos                  "/bin/bash"              2 months ago        Created                                         competent_nightingale
cd20b396a061        solita/ubuntu-systemd   "/bin/bash -c 'exec …"   2 months ago        Exited (137) 2 months ago                       systemd
fb62432cf3c1        ubuntu                  "/bin/bash"              3 months ago        Exited (130) 3 months ago                       jolly_mirzakhani
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Once you know the <code>CONTAINER ID</code> of the containers you want to delete, pass it to the
                <code>docker container rm</code> command. For example, to remove the first two containers listed in the
                output above, you would run:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container rm cc3f2ff51cab cd20b396a061</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>If you get an error message similar to the one shown below, it means that the container is running. You’ll
                need to stop the container before removing it.</p>
        <pre tabindex="0"><code class="language-output" data-lang="output">Error response from daemon: You cannot remove a running container fc983ebf4771d42a8bd0029df061cb74dc12cb174530b2036987575b83442b47. Stop the container before attempting removal or force remove.
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h3 id="removing-all-stopped-containers">Removing all stopped containers <a class="headline-link"
                        href="#removing-all-stopped-containers" aria-hidden="true">#</a></h3>
        <p>To remove all stopped containers, invoke the <code>docker container prune</code> command:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container prune</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>If you want to get a list of all non-running (stopped) containers that will be removed with
                <code>docker container prune</code>, use the following command:<span id="ezoic-pub-ad-placeholder-143"
                        class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 box-4 box-4143 adtester-container adtester-container-143"
                        data-ez-name="linuxize_com-box-4"><span id="div-gpt-ad-linuxize_com-box-4-0" ezaw="336"
                                ezah="280"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:280px;min-width:336px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[336, 280], 'linuxize_com-box-4', 'ezslot_7', 143, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-box-4-0');</script>
                        </span></span></p><span
                class="ezoic-autoinsert-video ezoic-longer_content"></span><!-- ezoic_video_placeholder-longer_content-640x360-999994-clearholder --><!-- ezoic_video_placeholder-longer_content-640x360-999994-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-longer_content-426x240-999994-clearholder --><!-- ezoic_video_placeholder-longer_content-426x240-999994-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-longer_content-384x216-999994-clearholder --><!-- ezoic_video_placeholder-longer_content-384x216-999994-nonexxxclearxxxblock -->
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container ls -a --filter status=exited --filter status=created</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h3 id="removing-containers-using-filters">Removing containers using filters <a class="headline-link"
                        href="#removing-containers-using-filters" aria-hidden="true">#</a></h3>
        <p><span id="ezoic-pub-ad-placeholder-161" class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 banner-1 banner-1161 adtester-container adtester-container-161"
                        data-ez-name="linuxize_com-banner-1"><span id="div-gpt-ad-linuxize_com-banner-1-0" ezaw="336"
                                ezah="280"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:280px;min-width:336px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[336, 280], 'linuxize_com-banner-1', 'ezslot_12', 161, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-banner-1-0');</script>
                        </span></span>The <code>docker container prune</code> command allows you to remove containers
                based on a certain condition using the <code>--filter</code> option.</p>
        <p>At the time of the writing of this article, the currently <a
                        href="https://docs.docker.com/engine/reference/commandline/container_prune" target="_blank"
                        rel="noopener">supported filters</a>
                are <code>until</code> and <code>label</code>. You can specify more than one filter by using multiple
                <code>--filter</code> options.</p>
        <p>For example, to remove all images created more than 12 hours ago, you would run:<span
                        id="ezoic-pub-ad-placeholder-144" class="ezoic-adpicker-ad"></span></p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container prune --filter "until=12h"</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h3 id="stop-and-remove-all-containers">Stop and remove all containers <a class="headline-link"
                        href="#stop-and-remove-all-containers" aria-hidden="true">#</a></h3>
        <p>To stop all running containers, enter the <code>docker container stop</code> command followed by the
                containers IDs:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container stop $(docker container ls -aq)</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>The command <code>docker container ls -aq</code> generates a list of all containers.<span
                        id="ezoic-pub-ad-placeholder-157" class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 large-mobile-banner-1 large-mobile-banner-1157 adtester-container adtester-container-157"
                        data-ez-name="linuxize_com-large-mobile-banner-1"><span
                                id="div-gpt-ad-linuxize_com-large-mobile-banner-1-0" ezaw="580" ezah="400"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:400px;min-width:580px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[580, 400], 'linuxize_com-large-mobile-banner-1', 'ezslot_14', 157, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-large-mobile-banner-1-0');</script>
                        </span></span></p>
        <p>Once all containers are stopped, remove them using the <code>docker container rm</code> command, followed by
                the containers ID list.<span id="ezoic-pub-ad-placeholder-145" class="ezoic-adpicker-ad"></span></p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker container rm $(docker container ls -aq)</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h2 id="removing-docker-images">Removing Docker Images <a class="headline-link" href="#removing-docker-images"
                        aria-hidden="true">#</a></h2>
        <p>When you download a Docker image, it is kept on the server until you manually remove it.</p>
        <h3 id="removing-one-or-more-images">Removing one or more images <a class="headline-link"
                        href="#removing-one-or-more-images" aria-hidden="true">#</a></h3>
        <p>To remove one or more Docker images, first, you need to find the IDs of the images:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker image ls</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>The output should look something like this:</p>
        <pre tabindex="0"><code class="language-output" data-lang="output">REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
centos                  latest              75835a67d134        7 days ago          200MB
ubuntu                  latest              2a4cca5ac898        2 months ago        111MB
linuxize/fedora         latest              a45d6dca3361        3 months ago        311MB
java                    8-jre               e44d62cf8862        3 months ago        311MB
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Once you’ve located the images you want to remove, pass their <code>IMAGE ID</code> to the
                <code>docker image rm</code> command. For example, to remove the first two images listed in the output
                above, you would run:<span id="ezoic-pub-ad-placeholder-146" class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 large-leaderboard-2 large-leaderboard-2146 adtester-container adtester-container-146"
                        data-ez-name="linuxize_com-large-leaderboard-2"><span
                                id="div-gpt-ad-linuxize_com-large-leaderboard-2-0" ezaw="728" ezah="90"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:90px;min-width:728px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[728, 90], 'linuxize_com-large-leaderboard-2', 'ezslot_15', 146, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-large-leaderboard-2-0');</script>
                        </span></span></p><span
                class="ezoic-autoinsert-video ezoic-longest_content"></span><!-- ezoic_video_placeholder-longest_content-640x360-999993-clearholder --><!-- ezoic_video_placeholder-longest_content-640x360-999993-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-longest_content-426x240-999993-clearholder --><!-- ezoic_video_placeholder-longest_content-426x240-999993-nonexxxclearxxxblock --><!-- ezoic_video_placeholder-longest_content-384x216-999993-clearholder --><!-- ezoic_video_placeholder-longest_content-384x216-999993-nonexxxclearxxxblock -->
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker image rm 75835a67d134 2a4cca5ac898</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>If you get an error message like the one below, it means that an existing container uses the image. To remove
                the image, you will have to remove the container first.</p>
        <div class="highlight">
                <pre tabindex="0" class="chroma"><code class="language-docker" data-lang="docker"><span class="line"><span class="cl">Error response from daemon: conflict: unable to remove repository reference <span class="s2">"centos"</span> <span class="o">(</span>must force<span class="o">)</span> - container cd20b396a061 is using its referenced image 75835a67d134<span class="err">
</span></span></span></code></pre><button class="code-copy button main small" type="button">Copy</button>
        </div>
        <h3 id="removing-dangling-images">Removing dangling images <a class="headline-link"
                        href="#removing-dangling-images" aria-hidden="true">#</a></h3>
        <p>Docker provides a <code>docker image prune</code> command that can be used to remove dangled and unused
                images.</p>
        <p>A dangling image is an image that is not tagged and is not used by any container. To remove dangling images,
                type:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker image prune</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove all dangling images.
Are you sure you want to continue? [y/N] y
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <div
                class="note bg-yellow-100 dark:bg-gray-800 border-l-4 border-yellow-400 dark:border-0 dark:text-yellow-200 p-6 my-6">
                <div class="flex">
                        <div class="text-sm font-sans w-full">Be careful when running this command. If you <a
                                        href="https://linuxize.com/post/how-to-build-docker-images-with-dockerfile/"
                                        target="_blank" rel="noopener">built an image</a>
                                without a tag, it would be removed.</div>
                </div>
        </div>
        <h3 id="removing-all-unused-images">Removing all unused images <a class="headline-link"
                        href="#removing-all-unused-images" aria-hidden="true">#</a></h3>
        <p>To remove all images that are not referenced by any existing container, not just the dangling ones, use the
                <code>prune</code> command with the <code>-a</code> option:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker image prune -a</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove all images without at least one container associated to them.
Are you sure you want to continue? [y/N] y
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h3 id="removing-images-using-filters">Removing images using filters <a class="headline-link"
                        href="#removing-images-using-filters" aria-hidden="true">#</a></h3>
        <p>With the <code>docker image prune</code> command, you can also remove images based on a particular condition
                with the <code>--filter</code> option.<span id="ezoic-pub-ad-placeholder-147"
                        class="ezoic-adpicker-ad"></span><span
                        class="ezoic-ad ezoic-at-0 leader-1 leader-1147 adtester-container adtester-container-147"
                        data-ez-name="linuxize_com-leader-1"><span id="div-gpt-ad-linuxize_com-leader-1-0" ezaw="336"
                                ezah="280"
                                style="position:relative;z-index:0;display:inline-block;padding:0;width:100%;max-width:1200px;margin-left:auto !important;margin-right:auto !important;min-height:280px;min-width:336px;"
                                class="ezoic-ad">
                                <script data-ezscrex="false" data-cfasync="false" type="text/javascript"
                                        style="display:none;">if (typeof ez_ad_units != 'undefined') { ez_ad_units.push([[336, 280], 'linuxize_com-leader-1', 'ezslot_16', 147, '0', '0']) }; __ez_fad_position('div-gpt-ad-linuxize_com-leader-1-0');</script>
                        </span></span></p>
        <p>At the time of the writing of this article, the currently <a
                        href="https://docs.docker.com/engine/reference/commandline/image_prune/#examples"
                        target="_blank" rel="noopener">supported filters</a>
                are <code>until</code> and <code>label</code>. You can use more than one filter.</p>
        <p>For example, to remove all images that are created more than seven days (168 hours) ago, you would run:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker image prune -a --filter "until=168h"</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h2 id="removing-docker-volumes">Removing Docker Volumes <a class="headline-link"
                        href="#removing-docker-volumes" aria-hidden="true">#</a></h2>
        <h3 id="removing-one-or-more-volumes">Removing one or more volumes <a class="headline-link"
                        href="#removing-one-or-more-volumes" aria-hidden="true">#</a></h3>
        <p>To remove one or more Docker volumes, run the <code>docker volume ls</code> command to find the ID of the
                volumes you want to remove.</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker volume ls</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>The output should look something like this:</p><span class="ezoic-autoinsert-ad ezoic-long_content"></span>
        <pre tabindex="0"><code class="language-output" data-lang="output">DRIVER              VOLUME NAME
local               4e12af8913af888ba67243dec78419bf18adddc3c7a4b2345754b6db64293163
local               terano
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Once you’ve found the <code>VOLUME NAME</code> of the volumes you want to remove, pass them to the
                <code>docker volume rm</code> command. For example, to remove the first volume listed in the output
                above, run:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker volume rm 4e12af8913af888ba67243dec78419bf18adddc3c7a4b2345754b6db64293163</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>If you get an error similar to the one shown below, it means that an existing container uses the volume. To
                remove the volume, you will have to remove the container first.</p>
        <div class="highlight">
                <pre tabindex="0" class="chroma"><code class="language-docker" data-lang="docker"><span class="line"><span class="cl">Error response from daemon: remove 4e12af8913af888ba67243dec78419bf18adddc3c7a4b2345754b6db64293163: volume is in use - <span class="o">[</span>c7188935a38a6c3f9f11297f8c98ce9996ef5ddad6e6187be62bad3001a66c8e<span class="o">]</span><span class="err">
</span></span></span></code></pre><button class="code-copy button main small" type="button">Copy</button>
        </div>
        <h3 id="removing-all-unused-volumes">Removing all unused volumes <a class="headline-link"
                        href="#removing-all-unused-volumes" aria-hidden="true">#</a></h3>
        <p>To remove all unused volumes, run the <code>docker image prune</code> command:<span
                        id="ezoic-pub-ad-placeholder-149" class="ezoic-adpicker-ad"></span></p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker volume prune</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove all local volumes not used by at least one container.
Are you sure you want to continue? [y/N]
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Use the <code>-f</code> or <code>--force</code> option to bypass the prompt.</p>
        <h2 id="removing-docker-networks">Removing Docker Networks <a class="headline-link"
                        href="#removing-docker-networks" aria-hidden="true">#</a></h2>
        <h3 id="removing-one-or-more-networks">Removing one or more networks <a class="headline-link"
                        href="#removing-one-or-more-networks" aria-hidden="true">#</a></h3>
        <p>To remove one or more Docker networks, use the <code>docker network ls</code> command to find the ID of the
                networks you want to remove.</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker network ls</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>The output should look something like this:</p><span class="ezoic-autoinsert-ad ezoic-longer_content"></span>
        <pre tabindex="0"><code class="language-output" data-lang="output">NETWORK ID          NAME                DRIVER              SCOPE
107b8ac977e3        bridge              bridge              local
ab998267377d        host                host                local
c520032c3d31        my-bridge-network   bridge              local
9bc81b63f740        none                null                local
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>Once you’ve located the networks you want to remove, pass their <code>NETWORK ID</code> to the
                <code>docker network rm</code> command. For example, to remove the network with the name
                <code>my-bridge-network</code>, run:</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker network rm c520032c3d31</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>If you get an error similar to the one shown below, it means that an existing container uses the network. To
                remove the network, you have to remove the container first.</p>
        <div class="highlight">
                <pre tabindex="0" class="chroma"><code class="language-docker" data-lang="docker"><span class="line"><span class="cl">Error response from daemon: network my-bridge-network id 6f5293268bb91ad2498b38b0bca970083af87237784017be24ea208d2233c5aa has active endpoints<span class="err">
</span></span></span></code></pre><button class="code-copy button main small" type="button">Copy</button>
        </div><span class="ezoic-autoinsert-ad ezoic-longest_content"></span>
        <h3 id="removing-all-unused-network">Removing all unused network <a class="headline-link"
                        href="#removing-all-unused-network" aria-hidden="true">#</a></h3>
        <p>Use the <code>docker network prune</code> command to remove all unused networks.</p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker network prune</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <p>You’ll be prompted to continue:</p>
        <pre tabindex="0"><code class="language-output" data-lang="output">WARNING! This will remove all networks not used by at least one container.
Are you sure you want to continue? [y/N] 
</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h3 id="removing-networks-using-filters">Removing networks using filters <a class="headline-link"
                        href="#removing-networks-using-filters" aria-hidden="true">#</a></h3>
        <p>With the <code>docker network prune</code> command, you can remove networks based on condition using the
                <code>--filter</code> option.</p>
        <p>At the time of the writing of this article, the currently <a
                        href="https://docs.docker.com/engine/reference/commandline/network_prune/" target="_blank"
                        rel="noopener">supported filters</a>
                are <code>until</code> and <code>label</code>. You can use more than one filter by using multiple
                <code>--filter</code> options.</p>
        <p>For example, to remove all networks that are created more than 12 hours ago, run:<span
                        id="ezoic-pub-ad-placeholder-148" class="ezoic-adpicker-ad"></span></p>
        <pre
                class="terminal"><code class="terminal-line" prefix="$">docker network prune -a --filter "until=12h"</code><button class="code-copy button main small" type="button">Copy</button></pre>
        <h2 id="conclusion">Conclusion <a class="headline-link" href="#conclusion" aria-hidden="true">#</a></h2>
        <p>We have shown you some of the common commands for removing Docker containers, images, volumes, and networks.
        </p>
        <p>You should also check out the official <a href="https://docs.docker.com/" target="_blank"
                        rel="noopener">Docker documentation</a>
                .</p>
        <p>If you have any questions, please leave a comment below.</p>
        <div class="flex flex-wrap my-8"><a
                        class="rounded tracking-wide text-sm font-medium text-white px-4 py-2 mr-2 mt-2 bg-indigo-700 hover:bg-indigo-800"
                        href="/tags/docker/">docker</a></div>
</div>