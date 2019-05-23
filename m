Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DADDD28CEC
	for <lists+linux-audit@lfdr.de>; Fri, 24 May 2019 00:31:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AFC03079B76;
	Thu, 23 May 2019 22:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC811001DDB;
	Thu, 23 May 2019 22:30:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60C384EBD7;
	Thu, 23 May 2019 22:30:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NMTsK5020029 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 18:29:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AF9D62732; Thu, 23 May 2019 22:29:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A6B619F9
	for <linux-audit@redhat.com>; Thu, 23 May 2019 22:29:52 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE01D7E429
	for <linux-audit@redhat.com>; Thu, 23 May 2019 22:29:35 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q16so6927109ljj.8
	for <linux-audit@redhat.com>; Thu, 23 May 2019 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n2QPlerzsKppf8McCpwvektWZOG/0KEGym2nosJrniI=;
	b=ZnGWUZ6lT+Kh/HMGBZziVAihUk47TA8ZpaMFdsMVXUDwtoYw2VvcoV04oLTh6Ct5Vx
	wugDNVfLAPnimhZqXFRc8jRlGJZ2bnAmj+ZeA0h1o04cB8OG/oKy2g1mIklq31wkkpNE
	8MbiaRVlLaGJmEjwXUFOQUV60LzNGNk1/Mpv/WOcCkVVndQgunzfAlpYMBZSbYawBs+e
	Pv7fxjhbShNF4y1DgSklMUh6EYncczkyulhyb1/49KR0W9+R/TFZkHRSTtLhc6LKs+4r
	Po1o7pXGjipScg9c1d4R9bR150sBtPAp6fyuZz+zZuxPDnyJkT66jDYE/oEaIXZxMVOh
	/C0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n2QPlerzsKppf8McCpwvektWZOG/0KEGym2nosJrniI=;
	b=XntBFQQhzxXuP/eDHbp4xtbGYM8LWAR5y0PvJ4jj3O91Z2m23ydyFWzqmlud8/djsZ
	muJgBhx42rqt4U/sWZJhMqwVWt4k7Mfv0TJm8AZu4f0OpaoNFImYi4Hvnv0cnK1HtNyj
	34e1wsmgMe4bkFWxbot3lxBY9pcUOwb+Osq7St6pPycdnv9EPPCV2SU4gxNnqELwfEzW
	VeTB4wFQyDgVzH4Sr4ql+E8GzePSUj629M+KNoUOaESOBPReKiMUl7S5hqlT1l2QHYz6
	jh5SGvcUMmNa562whjx3AdQyk6xbxGDKdd0YGGbKRQ7AbnHikKh8O+D4Mmmt/y41CBpI
	DZbA==
X-Gm-Message-State: APjAAAX09r1ex8dGU1lIC3S9LMWmVReCq/FVYvlLNDZkqjFPUc2gqS/U
	JNQpSh7DT3ryNOsJuJIsSCciyWi9n2xmIIcw49Gw
X-Google-Smtp-Source: APXvYqwTjQZLesAx45nuFrkQOpVvRgQwfr/SXqgZmH3cIGi5wT8zllKKn2dNbMnWOzxrmrvul1JsMLNWf1rM8GcZQMw=
X-Received: by 2002:a2e:8555:: with SMTP id u21mr42410265ljj.133.1558650574041;
	Thu, 23 May 2019 15:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <CADK+bLxes0UKt0Uoj64h=vNhrJfA0RVj1Ai8onLYbMCG-5uB6g@mail.gmail.com>
	<1632868.IOzhRHTBn1@x2>
	<20190523211032.nj7rsdxkj6uf5wh7@madcap2.tricolour.ca>
In-Reply-To: <20190523211032.nj7rsdxkj6uf5wh7@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 May 2019 18:29:22 -0400
Message-ID: <CAHC9VhRW-YmVzqDhqc8QLWknuKQDWMzybe1mzcKZOMvk_t6LUA@mail.gmail.com>
Subject: Re: Auditing write syscall
To: Richard Guy Briggs <rgb@redhat.com>, Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 22:29:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 22:29:37 +0000 (UTC) for IP:'209.85.208.171'
	DOMAIN:'mail-lj1-f171.google.com'
	HELO:'mail-lj1-f171.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.171 mail-lj1-f171.google.com 209.85.208.171
	mail-lj1-f171.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 23 May 2019 22:31:09 +0000 (UTC)

On Thu, May 23, 2019 at 5:12 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-05-14 09:55, Steve Grubb wrote:
> > Hello,
> >
> > On Monday, May 13, 2019 3:43:54 PM EDT Ondra N. wrote:
> > > I would like to ask a question about auditing write syscalls.  I am trying
> > > to monitor all filesystem changes in a specific directory and process the
> > > changes in near real time - audispd, was very helpful with that.
> > >
> > > What concerns me is what if a filedescriptor is kept open for long periods
> > > of time and written to once in a while? Only the open syscall is logged
> > > when using a rule like this one.
> > >
> > > auditctl -w /tmp/rnd_pop -p wa -k test_key
> >
> > Right. And if this triggers then you have to assume that the file was modified.
> > In the past I worked with various upstream projects to have them open a
> > descriptor read only and reopen when they need to modify files. This cuts down
> > on false alarms.
> >
> > > I was thinking that maybe being more explicit about what I want to do could
> > > help like setting up a rule like this one.
> > >
> > > auditctl -a always,exit -F dir=/tmp/rnd_pop -F perm=w -F succes=1 -k
> > > test_key
> > >
> > > But it doesnt seem to work for me, I guess I cannot filter write syscall by
> > > directory because nothing ever shows up in the audit.log with a rule like
> > > this.
> >
> > The directory has to be immediately accessible to the syscall at the time of
> > the syscall. When open is called, the path is immediately available as it is
> > one of the syscall parameters. The write only has the FD which does not have
> > the path associated with the FD accessible. Something in the kernel does keep
> > this info around as the procfs has path info. But I think it's racey and
> > could be stale  if you have a multithreaded app.

[Sorry, I saw Steve replied with a lot of text and assumed it had been
sufficiently answered, it wasn't until I saw Richard's reply that I
realized there were still lingering questions :)]

> The FD points to a struct file with struct path that includes a vfsmnt
> and a dentry/inode, which could be used to create a PATH record, I
> think.

Unfortunately you really can't reliably recreate the proper full path
after the fact because things can change at any given point in time.
The only time you can guarantee that a given pathname is valid, for a
particular process in a particular set of namespaces, is at the exact
point in time when the kernel resolves the pathname to a file.  I
would need to go look at the locking again, but I believe it is even
possible for the pathname to be valid during the open() syscall, but
be invalid by the time open() returns control to userspace.

> A hook could be added to the write syscall to store it with
> audit_file().  Similar hooks would need to be added to other syscalls
> that read and access and execute FDs to round out that functionality.
> This is already present for chmod, chown, f*xattr.  Having a generic
> syscall parser that can detect these might be possible, but would
> probably present an unacceptable performance hit.
>
> I do have concerns that it could be racey and stale.

If we cached it as you say in an audit specific struct (e.g.
audit_context), I think we could probably solve the race conditions
but it would require some bad locking and likely hooking
fd_install()/close_fd() and I *really* don't think we want to do that.
I would offer that auditing the various open()-esque syscalls and
assuming modifications (as Steve already described) is probably the
best option for the foreseeable future.

> > I think there was some reason why this info cannot be used for path
> > resolution for syscall filtering. I think Paul or Richard may need to answer
> > why this cannot be used. Perhaps it could be that how do you know in a
> > generic way based on any given syscall that one parameter is a file descriptor
> > that can be cross referenced?
>
> This is even Al Viro territory...

I'm sure Al would have some better commentary on this than me, but to
do this properly would likely involve caching the full path used by
the various open() syscalls for the life of the given fd and then
doing some rather painful string comparisons on each file i/o syscall
- no thank you ;)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
