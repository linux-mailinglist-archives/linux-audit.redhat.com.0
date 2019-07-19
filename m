Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C86EADC
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jul 2019 20:52:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5C1B308404C;
	Fri, 19 Jul 2019 18:52:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE4B5DA38;
	Fri, 19 Jul 2019 18:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6A551972D;
	Fri, 19 Jul 2019 18:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JIlUo2029262 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 14:47:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9855C619AC; Fri, 19 Jul 2019 18:47:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D515610A6;
	Fri, 19 Jul 2019 18:47:25 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2029D3091783;
	Fri, 19 Jul 2019 18:47:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a00:5f00:102:0:3aba:f8ff:fe58:9ca1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested) (Authenticated sender: smcv)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9A2E28C7EA;
	Fri, 19 Jul 2019 19:47:22 +0100 (BST)
Date: Fri, 19 Jul 2019 19:47:20 +0100
From: Simon McVittie <smcv@collabora.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: Preferred subj= with multiple LSMs
Message-ID: <20190719184720.GB24836@horizon>
References: <CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<20190718131034.GA12581@horizon>
	<45661e97-2ed0-22e5-992e-5d562ff11488@schaufler-ca.com>
	<20190719121540.GA1764@horizon>
	<720880ca-834c-1986-3baf-021c67221ae2@schaufler-ca.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <720880ca-834c-1986-3baf-021c67221ae2@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Fri, 19 Jul 2019 18:47:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 19 Jul 2019 18:47:24 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'smcv@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk <smcv@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 14:51:57 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 19 Jul 2019 18:52:20 +0000 (UTC)

Thanks for considering user-space in this, and sorry if I'm hijacking
this thread a bit (but I think some of the things I'm raising might be
equally applicable for audit subjects).

On Fri, 19 Jul 2019 at 09:29:17 -0700, Casey Schaufler wrote:
> On 7/19/2019 5:15 AM, Simon McVittie wrote:
> > However, I think it would be great to have multiple-"big"-LSM-aware
> > replacements for those interfaces, which present the various LSMs as
> > multiple parallel credentials.
> 
> Defining what would go into liblsm* is a task that has fallen to
> the chicken/egg paradox. We can't really define how the user-space
> should work without knowing how the kernel will work, and we can't
> solidify how the kernel will work until we know what user-space
> can use.

I was hoping the syscall wrappers in glibc would be a viable user-space
interface to the small amount of LSM stuff that dbus needs to use in an
LSM-agnostic way. That's what we use in dbus at the moment (in practice
just getsockopt, but I'd also be reading /proc/self/attr/current if there
was a specification for how to normalize it to match SO_PEERSEC results)
and it's no harder than the rest of the syscall-level APIs.

A single LSM-agnostic shared library would be the next best thing from
my point of view.

> An option that hasn't been discussed is a display option to provide
> the Hideous format for applications that know that's what they want.
> Write "hideous" into /proc/self/attr/display, and from then on you
> get selinux='a:b:c:d',apparmor='z'. This could be used widely in liblsm
> interfaces.

If the way to parse/split it is documented, then this would be easier
for dbus-daemon than continually resetting attr/display. It would be
especially good if you can document a way to find out which one of the
many labels would have been seen by an older user-space process that never
wrote to attr/display ("it's the first one in the list" would be fine),
so that we can put that one in our backwards-compatible API to clients.

Or, alternatively, we could pass it on directly to our clients and let
*them* parse it (possibly by using liblsm), the same way AppArmor-aware
D-Bus clients have to know how to use either aa_splitcon() or their
own parsing to go from the raw SO_PEERSEC result
"/usr/bin/firefox (enforce)" to the pair ("/usr/bin/firefox", "enforce")
that they probably actually wanted.

> > Do you mean that if process 11111 writes (for example) "apparmor" into
> > /proc/11111/attr/display, and then reads /proc/22222/attr/current
> > or queries the SO_PEERSEC of a socket opened by process 22222,
> > it will specifically see 22222's AppArmor label and not 22222's SELinux
> > label?
> 
> Process 11111 would see the AppArmor label when reading
> /proc/22222/attr/current. The display value is controlled
> by process 11111 so that it can control what data it wants
> to see.

OK, that's what I'd hoped.

> The display is set at the task level, so should be thread safe.

OK, good. However, thinking more about this, I have other concerns:

* In library code that can be used by a thread (task) that also uses other
  arbitrary libraries, or in an executable that uses libraries that might
  be interested in LSMs, the only safe way to deal with attr/display would
  be this sequence:

    - write desired value to /proc/self/attr/display
    - immediately read /proc/other/attr/current or query SO_PEERSEC

  and it would not be safe to rely on writing /proc/self/attr/display
  just once at startup, because some other library might have already
  changed it between startup and the actual read. Paradoxically, this
  maximizes the chance of breaking a reader that was relying on writing
  /proc/self/attr/display once during startup.

* If an async signal handler needs to know a LSM label for whatever
  reason, it will break anything in the same thread that was relying on
  that sequence, because it might have interrupted them between their
  write and their read:

    main execution path                  signal handler
    -------------------                  --------------

    write "apparmor" to attr/display
    (interrupted by async signal)
                                         write "selinux" to attr/display
                                         read attr/current or SO_PEERSEC
                                         do other stuff with SELinux label
                                         return
    (resumes)
    read attr/current or SO_PEERSEC
    expect an AppArmor label
    get a SELinux label
    sadness ensues

  Of course it's probably crazy for an async signal handler to do
  this... but people do lots of odd things in async signal handlers,
  and open(), read(), write(), getsockopt() are all async-signal-safe
  functions, so it's at least arguably valid.

> Writing to display does not require privilege, as it affects only
> the current process. The display is inherited on fork and reset on
> a privileged exec.

Another concern here: are you sure it shouldn't be reset on *any*
exec? Lots of programs (including dbus-daemon) fork-and-exec arbitrary
child processes that come from a different codebase not under our
control and aren't necessarily LSM-stacking-aware. I don't really want
to have to reset /proc/self/attr/display in our increasingly crowded
after-fork-but-before-exec code path (which, according to POSIX, is not
a safe place to invoke any non-async-signal-safe function, so we can't
easily do error handling if something goes wrong there).

Is there any possibility of having a parallel kernel API that,
if it exists, always returns the whole stack, maybe something
like /proc/<pid>/attr/current_stack and the SO_PEERSECLABELS that I
suggested previously, instead of repurposing /proc/<pid>/attr/current
and SO_PEERSEC to have contents that vary according to ambient process
state in their reader? (Bonus points if they are documented/defined with
a particular syntactic normalization this time, unlike the situation
with /proc/<pid>/attr/current and SO_PEERSEC where in principle you
need LSM-specific knowledge to know whether a trailing "\n" or "\0"
is safe to discard.)

    smcv

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
