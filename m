Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2371A45
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 16:26:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34F3DC18B2D2;
	Tue, 23 Jul 2019 14:26:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0979B5C230;
	Tue, 23 Jul 2019 14:26:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6FC51800206;
	Tue, 23 Jul 2019 14:25:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MBakAL011915 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 07:36:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98176608A5; Mon, 22 Jul 2019 11:36:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F0B60852;
	Mon, 22 Jul 2019 11:36:42 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75FCA308A98C;
	Mon, 22 Jul 2019 11:36:40 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a00:5f00:102:0:3aba:f8ff:fe58:9ca1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested) (Authenticated sender: smcv)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0A2C028A898;
	Mon, 22 Jul 2019 12:36:39 +0100 (BST)
Date: Mon, 22 Jul 2019 12:36:36 +0100
From: Simon McVittie <smcv@collabora.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: Dbus and multiple LSMs (was Preferred subj= with multiple LSMs)
Message-ID: <20190722113636.GA12250@horizon>
References: <CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<20190718131034.GA12581@horizon>
	<45661e97-2ed0-22e5-992e-5d562ff11488@schaufler-ca.com>
	<20190719121540.GA1764@horizon>
	<720880ca-834c-1986-3baf-021c67221ae2@schaufler-ca.com>
	<20190719184720.GB24836@horizon>
	<700301b3-b607-3234-15ae-b958df2b59d3@schaufler-ca.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <700301b3-b607-3234-15ae-b958df2b59d3@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Mon, 22 Jul 2019 11:36:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 22 Jul 2019 11:36:41 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'smcv@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk <smcv@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 23 Jul 2019 10:25:44 -0400
Cc: Richard Guy Briggs <rgb@redhat.com>, SELinux <selinux@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 23 Jul 2019 14:26:06 +0000 (UTC)

On Fri, 19 Jul 2019 at 13:02:24 -0700, Casey Schaufler wrote:
> On 7/19/2019 11:47 AM, Simon McVittie wrote:
> > I was hoping the syscall wrappers in glibc would be a viable user-space
> > interface to the small amount of LSM stuff that dbus needs to use in an
> > LSM-agnostic way.
> 
> I don't see how to do that without making the Fedora and Ubuntu user space
> environments [not] remain functional.

What I was thinking of was a second, parallel kernel <-> user-space
interface (like the SO_PEERSECLABELS that I suggested) for future/updated
user-space components. SO_PEERSEC would continue to return some
hopefully-backwards-compatible thing, but would be deprecated, because it
cannot fully represent the reality of LSM stacking while remaining
backwards-compatible.

> I see display being used in scripts:
> 
> 	echo apparmor > /proc/self/attr/display
> 	apparmor-do-stuff --options --deamon
> 
> much more than inside new or updated programs.

Note that this implicitly relies on echo being a shell builtin, which
is common but not guaranteed (I don't think). It would work in bash or
dash, though.

If apparmor-do-stuff no longer works, and you have to wrap a shell
script around it, isn't that the same amount of user-space breakage as
if apparmor-do-stuff no longer works and you have to install a newer
version that does work? Either way, the sysadmin must take action to
change user-space components. I think the attr/display thing only reduces
the magnitude of the user-space changes required to catch up, and doesn't
eliminate the fact that those changes were needed.

> > Lots of programs (including dbus-daemon) fork-and-exec arbitrary
> > child processes that come from a different codebase not under our
> > control and aren't necessarily LSM-stacking-aware. I don't really want
> > to have to reset /proc/self/attr/display in our increasingly crowded
> > after-fork-but-before-exec code path
> 
> My hope is that new and updated programs will have to tools
> they need to get it right, and that those that don't won't
> fall over on a well configured system.

The problem I see here is that if we assume dbus-daemon is a new/updated
program that has set /proc/self/attr/display = "hideous" in order to get
the full stack of labels for its peer processes, then it will be causing
side-effects on its separately-maintained child processes - they will
no longer be able to benefit from the backwards-compatility thing where
/proc/self/attr/display (effectively) defaults to the first LSM that
has labels, because dbus-daemon overrode that (unless dbus-daemon takes
action to reverse it between fork and exec). This partially defeats the
semi-backwards-compatible handling of the existing kernel interfaces.

If dbus-daemon could read SO_PEERSECLABELS instead of SO_PEERSEC and
read /proc/<pid>/attr/current_stack instead of /proc/<pid>/attr/current,
leaving /proc/self/attr/display untouched, then this concern would go away.

Similarly, dbus-daemon can be linked to libselinux and/or libapparmor
(on Debian it's linked to both, even in the non-stackable present,
and the right one for the kernel configuration is chosen at runtime).
If one of those libraries wrote to /proc/self/attr/display, then the rest
of dbus-daemon's main thread and all child processes would implicitly be
getting the result of that - even if dbus-daemon itself had not yet been
updated for stacked LSMs (in which case it cannot be expected to reverse
their action between fork and exec, because it's an older codebase that
doesn't yet know that "big" LSMs can be stacked).

So I think libselinux and libapparmor should be enhanced to use
new kernel interfaces that get the label they want to get (either
just that label, or all the labels), instead of being enhanced to
write /proc/self/attr/display to change the meaning of old kernel
interfaces. Otherwise they can break other code in their process or
their subprocesses.

> > instead of repurposing /proc/<pid>/attr/current
> > and SO_PEERSEC to have contents that vary according to ambient process
> > state in their reader?
> 
> In addition, yes. Instead of? I don't think that we can have a
> backward compatibility story that flies without it.

Consider only SELinux and AppArmor for a moment (I know there are other
"big" LSMs like Smack, but this same reasoning applies to any pair, with
appropriate search-and-replace on their names).

Neither SELinux nor AppArmor: there are no labels, nothing changed.

AppArmor is the only "big" LSM in the stack (Ubuntu): previously,
the label was the AppArmor label; now, if attr/display is not altered,
the label is the one used by the first "big" LSM in the stack, which is
AppArmor. Nothing changed.

SELinux is the only "big" LSM in the stack (Red Hat): same as for AppArmor
being the only "big" LSM in the stack, but with s/AppArmor/SELinux/.

SELinux and AppArmor stacked: this is a situation that could not exist
before, so distro/sysadmin action must have been necessary to make it
happen. However much ambient process state is invented, I don't see any
way to make both SELinux and AppArmor user-space work without modifications:
at least one of them (the one that is second in the stack) has to use new
kernel interfaces, or alter attr/display to change the meaning of the old
kernel interfaces, or something similar, to get the second LSM's labels.
So distro/sysadmin action in user-space is also going to be necessary here
whatever happens - backward compatibility has already been broken, it's
only a question of how intrusive the user-space changes are. Is it really
so much worse if the distro/sysadmin action taken to update user-space
has to take the form of using new kernel interfaces that always do the
same thing, rather than changing the meaning of old kernel interfaces?

    smcv

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
