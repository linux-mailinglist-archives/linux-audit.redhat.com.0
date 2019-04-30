Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 03824FF02
	for <lists+linux-audit@lfdr.de>; Tue, 30 Apr 2019 19:39:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 955C730BC748;
	Tue, 30 Apr 2019 17:39:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C8DD1C7;
	Tue, 30 Apr 2019 17:39:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 560AB3FA4A;
	Tue, 30 Apr 2019 17:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UHc3Qd019807 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 13:38:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50F2210E4C6A; Tue, 30 Apr 2019 17:38:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA1610E723A
	for <linux-audit@redhat.com>; Tue, 30 Apr 2019 17:37:59 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C0E5753DC
	for <linux-audit@redhat.com>; Tue, 30 Apr 2019 17:37:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t1so3476947lje.10
	for <linux-audit@redhat.com>; Tue, 30 Apr 2019 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YXsmVk+ZSnvH7miYb/NOhqgFtfsKbInklPuraWGi5JE=;
	b=NTj6xlLCrLqR1wOqdD6t/r9qR7jD9zaBakXAGXhSkMKIBeJCrGt4PARB0632N2AvYn
	OwS61qLdxt2pt4dl6BN2AdAq9aj4U3FAs/6z0yclbp1FPrHiw/4AzNB5lZjnuLxl2Fjj
	cVWm7uoto3St6NQaNLyzfBvlRnfU3Ey80wpY0NGTdDAaU2256mVfin+lwtnYKEBr4KzU
	S4yh3n6SEyP6RxJQdeNNaqIlrTobyQHE2t4OBX4RKUlpWe/Mjs5VKA/MELTyCJ4ylJw+
	eEfK8iUo6qBqbRVdXFHbIuu6anchhKL3kiFWQA+8wCp66ksmDFhRte89BkBF+4jaaaIj
	2RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YXsmVk+ZSnvH7miYb/NOhqgFtfsKbInklPuraWGi5JE=;
	b=L8zl9PYO5Pga8RpM6btY1STK6feNmB2XGdI3uS+utRQz4/o+bpRUXHPPVQ9aT2KswZ
	KBzXln8gJsXmxN7tdrDxfRkdPYW7uZIDJG8YMb3NQcuno60fu51oz7KKDSaB0KqDqprV
	YfqE4c4bOdNSYaNemvWUM2vsPeGh73PN08AEvHC1jyvBzSS/20XLZotHD70OXQtv95cl
	cRH4jR7oYl7qMcunyBI2/OgrxaR5tZsNT73UeGqjsUuQ1VunOSkjCCIxk3pwM2sCI2NE
	JjubdWUzi41awQraAhbGY9p4zmSXqbyfVWZJML036/xtRJKjzytES71i/tIXpl/BtPRz
	9ZNw==
X-Gm-Message-State: APjAAAVvn/gxxGZOQB1iXvr9WZHYQtt+qjui4TiMTQN80OmSYzMRV0cK
	491FVlB5ypDSCw/xb4zSBWImmtzbiliZuUuMDVxi
X-Google-Smtp-Source: APXvYqzpmDHEaG2WPL8RrULakNX8a72Hk689nqUFx/j0NyHglu/vYgy846H9qyYucA84GkcdsIa/ONvhBKcvjH4sB6w=
X-Received: by 2002:a2e:888a:: with SMTP id k10mr23055874lji.57.1556645874366; 
	Tue, 30 Apr 2019 10:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <cdfe08c120ddf24429a6fc90c995284aa173f818.1556297772.git.rgb@redhat.com>
	<CAHC9VhRykfjMpTpCSwX9bL1CX6cCxqd=qnr5xximj8v_k4Y9ug@mail.gmail.com>
	<20190430170132.qhdnryr4mjtyc4fp@madcap2.tricolour.ca>
In-Reply-To: <20190430170132.qhdnryr4mjtyc4fp@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 30 Apr 2019 13:37:41 -0400
Message-ID: <CAHC9VhQ4MeDMXvVAZqD03uU_LkaXDbchO76q40OzrwtGoerNAg@mail.gmail.com>
Subject: Re: [PATCH ghak64 V1] audit: add saddr_fam filter field
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 30 Apr 2019 17:37:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 30 Apr 2019 17:37:58 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.208.194
	mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>,
	Eric Paris <eparis@parisplace.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 30 Apr 2019 17:39:39 +0000 (UTC)

On Tue, Apr 30, 2019 at 1:01 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-04-27 10:09, Paul Moore wrote:
> > On Fri, Apr 26, 2019 at 1:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > Beyond that, looking at the patch below it seems like there is an
> > obvious omission regarding validating the address families; some
> > updates to audit_field_valid() to verify that the specified address
> > family is greater than AF_UNSPEC and less than AF_MAX would be good to
> > have.
>
> I thought of that and as you can see had added it to the userspace code
> that accompanies it.  There isn't really any harm to allow it to go
> outside those address family limits if someone really wants to do that.

I see it as a usability issue.  In general terms, we shouldn't allow
admins to add a nonsense filter rule to the kernel, and we shouldn't
rely on the userspace to catch everything.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
