Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E942B3041F
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 23:35:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3AA530C0DE5;
	Thu, 30 May 2019 21:35:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 578501001938;
	Thu, 30 May 2019 21:35:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF5F118433A1;
	Thu, 30 May 2019 21:35:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4ULT8gS020664 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 May 2019 17:29:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81CAE7D5B3; Thu, 30 May 2019 21:29:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7907ADD1
	for <linux-audit@redhat.com>; Thu, 30 May 2019 21:29:06 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 861A6308339F
	for <linux-audit@redhat.com>; Thu, 30 May 2019 21:29:05 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id s57so8887154qte.8
	for <linux-audit@redhat.com>; Thu, 30 May 2019 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho-ws.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xUrEWzZQfNW3Ko2ZWNLxImFggBKxzmBgkihSD1gWgW0=;
	b=Is1zd4SDvd6ZWvtvAYJ67dlcwr8V/61dT3N1tlUOkcZwnsfMcEtreN/4wMWHgkijuJ
	fehIbSV7QgKzRoi8VwUd0W3WoXvOqExCo54m3DUWvZUS4I4JGGA9nNtGyMoFCaqPHUhd
	VxlWr6suY3YYkFaNBvaCCLAgcx4fsNiUjFNkmboSgvURicz+xVee3x2fjbJ/RZaI0fXc
	di/c6A8CiJ9tE3erznkf1k+x25DEYKFnKRAqv7OCt9cZkE4Yo9/znC9IX8mfIklKs7yd
	Gkn4IjHNQ5rZvpyrDAC5jDFha3I65uww7VBZkCmusfLq9q94+NHvcaB9Kal9s6v3VSuv
	Rtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xUrEWzZQfNW3Ko2ZWNLxImFggBKxzmBgkihSD1gWgW0=;
	b=AEJ7ltyFHQd6a86NYcjGKfvWqhN36X4zyznZyo2//P9u5bND+MSLTb35GfTch1Lpo1
	sn6zVmmbkMfh46trkjXocQ0Nr2Wmms9ooX32cHZZDRxmZaDkd1RVdLWNgQA2wJwGI81d
	w+pTfPkMhYeykDwXRVtMKkiqbUTsD2HV0TWUtMk791fKHwhwxCnfdVXLX10MFrUoxwtT
	kMFmixNNfi1XDxwACxnjH/7TLM0IqSlEQzVpPeGoSLHW0DmfDquaF839gvvh9hhYDTCM
	7AZwiuYlBk0GJ9pt1HZxRIvG81xXWOcNCkbwiAQEYbj4usxQeB54KLjrK8gc5Q4HJjH+
	tfMA==
X-Gm-Message-State: APjAAAXzzTyhe+KzB/7LaFxAFP3EwqLnwN4H4dLjo7jaKBaJA8HYi1cx
	2rFaqAzcUNs2m+6N6m8vDBmtJA==
X-Google-Smtp-Source: APXvYqw3Gbiesdzd/yRAh8ImxVsYAztosD/Dz/fx+HhBvOt45z0S/5LhH2Nn++H9E2AwV5xsyZZVcQ==
X-Received: by 2002:aed:39e5:: with SMTP id m92mr5818400qte.106.1559251744607; 
	Thu, 30 May 2019 14:29:04 -0700 (PDT)
Received: from cisco ([2601:280:6:ca14:840:fa90:7243:7032])
	by smtp.gmail.com with ESMTPSA id d5sm1904111qtj.3.2019.05.30.14.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 May 2019 14:29:03 -0700 (PDT)
Date: Thu, 30 May 2019 15:29:00 -0600
From: Tycho Andersen <tycho@tycho.ws>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
Message-ID: <20190530212900.GC5739@cisco>
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 30 May 2019 21:29:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 30 May 2019 21:29:05 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'tycho@tycho.ws' RCPT:''
X-RedHat-Spam-Score: -0.006  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_NONE) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <tycho@tycho.ws>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 30 May 2019 17:34:39 -0400
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 30 May 2019 21:35:31 +0000 (UTC)

On Thu, May 30, 2019 at 03:29:32PM -0400, Paul Moore wrote:
> 
> [REMINDER: It is an "*audit* container ID" and not a general
> "container ID" ;)  Smiley aside, I'm not kidding about that part.]

This sort of seems like a distinction without a difference; presumably
audit is going to want to differentiate between everything that people
in userspace call a container. So you'll have to support all this
insanity anyway, even if it's "not a container ID".

> I'm not interested in supporting/merging something that isn't useful;
> if this doesn't work for your use case then we need to figure out what
> would work.  It sounds like nested containers are much more common in
> the lxc world, can you elaborate a bit more on this?
> 
> As far as the possible solutions you mention above, I'm not sure I
> like the per-userns audit container IDs, I'd much rather just emit the
> necessary tracking information via the audit record stream and let the
> log analysis tools figure it out.  However, the bigger question is how
> to limit (re)setting the audit container ID when you are in a non-init
> userns.  For reasons already mentioned, using capable() is a non
> starter for everything but the initial userns, and using ns_capable()
> is equally poor as it essentially allows any userns the ability to
> munge it's audit container ID (obviously not good).  It appears we
> need a different method for controlling access to the audit container
> ID.

One option would be to make it a string, and have it be append only.
That should be safe with no checks.

I know there was a long thread about what type to make this thing. I
think you could accomplish the append-only-ness with a u64 if you had
some rule about only allowing setting lower order bits than those that
are already set. With 4 bits for simplicity:

1100         # initial container id
1100 -> 1011 # not allowed
1100 -> 1101 # allowed, but now 1101 is set in stone since there are
             # no lower order bits left

There are probably fancier ways to do it if you actually understand
math :)

Since userns nesting is limited to 32 levels (right now, IIRC), and
you have 64 bits, this might be reasonable. You could just teach
container engines to use the first say N bits for themselves, with a 1
bit for the barrier at the end.

Tycho

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
