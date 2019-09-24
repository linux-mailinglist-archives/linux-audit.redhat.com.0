Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 400F8BC095
	for <lists+linux-audit@lfdr.de>; Tue, 24 Sep 2019 05:01:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D23DC057E9A;
	Tue, 24 Sep 2019 03:01:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F283160852;
	Tue, 24 Sep 2019 03:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 745AF1803B37;
	Tue, 24 Sep 2019 03:01:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8O31UmB013567 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 23:01:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B69256012D; Tue, 24 Sep 2019 03:01:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF73660461
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 03:01:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C968010C0930
	for <linux-audit@redhat.com>; Tue, 24 Sep 2019 03:01:26 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r22so194979lfm.1
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 20:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ywjzdhy6ZnHy91q5BEB8BAGGE1BicH70UfBVqn5Luns=;
	b=cO/oSUMbqftn/mRjg/yWzqWrdhcGuKurKhpq40Gtw4EM+RBkt8zS55g/bDTxXDhEfa
	QHBwYJK/+pTXDxAAt0oIIuJwCBJY2pjrHmuhNyJWblbhpn5z0osYB/59u05i2hsFsUpD
	BBebw/GRByLd+YQ1m81bHdyFga6JCikoSpAh7Rr8M1wXbaBBS5rz58LiD3REWiidnEdI
	63o59qDCdAzDhvbD8bMSLn9p3rFvaeC1UOe0d150gMPu2zdyQhHb4zhi9yG0rCe5gp2w
	6KHj+w4CmWn6TXRyRQfTeiy7Ydbpf+eDoS0hov2N+31/cdJ7QVRmswf0SVOEODCXCIB4
	vPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ywjzdhy6ZnHy91q5BEB8BAGGE1BicH70UfBVqn5Luns=;
	b=NQpHuGMwuXYVCskfAAoncvSdxH1nb6DfR7BUiNWZsyOuCAgOxaHrxhZGsrXQm0Tp/x
	CZfNdB89lg/Ab0aMdg708jc+5gM/JmxNQi3olk0JqFF5/sjZWIa/z8qqNWFQXfvNrgoS
	QhyQ64Ro6IU+j9To0ol8N8gAGTDgcnAMRmZZqF4VAFzrGp4y8zrHHdy9n//5SF51d20a
	EaDKnDzhmIGC9g5yYsAW/lGDoZbZ7QKL+tcdWUhXp4KrXDxpn/TuJ9f4UAbWPnKlBR5K
	Aj2Y1pleAOxy/IukA9VOVL4yztOhaMME+hhbayTglcu5VWqL7Jqya0knz7sTKon3YH1a
	t7fA==
X-Gm-Message-State: APjAAAWDKP4gAjI+ep5Pc+2WEPU6RGyN8XxYQwI4VB7LWyDPtOVjUkvb
	gMze6/ECgCuLjAZetAya6M5lcuuyKMXJ6eg377BKHew=
X-Google-Smtp-Source: APXvYqygHGRqSiC0MdlpPqCpY5SKO9zK/4Wg8MLQuNG5binVe9bwa3y9dMaA5+5YZBlykt9bLXhE2YJdDVX2tJ22bU8=
X-Received: by 2002:a19:6517:: with SMTP id z23mr291949lfb.31.1569294085123;
	Mon, 23 Sep 2019 20:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
In-Reply-To: <20190923210021.5vfc2fo4wopennj5@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Sep 2019 23:01:14 -0400
Message-ID: <CAHC9VhQPvS7mfmeomRLJ+SyXk=tZprSJQ9Ays3qr=+rqd=L16Q@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Tue, 24 Sep 2019 03:01:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Tue, 24 Sep 2019 03:01:27 +0000 (UTC) for IP:'209.85.167.50'
	DOMAIN:'mail-lf1-f50.google.com' HELO:'mail-lf1-f50.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.50 mail-lf1-f50.google.com 209.85.167.50
	mail-lf1-f50.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-audit@redhat.com,
	Linux Kernel <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 24 Sep 2019 03:01:41 +0000 (UTC)

On Mon, Sep 23, 2019 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-09-23 12:14, Paul Moore wrote:
> > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
> > >
> > > I have some hosts that are constantly spewing audit messages like so:
> > >
> > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
>
> Odd.  It appears these two above should have the same serial number and
> should be accompanied by a syscall record.  It appears that it has no
> context to update to connect the two records.  Is it possible it is not
> being called in a task context?  If that were the case though, I'd
> expect audit_dummy_context() to return 1...

Yeah, I'm a little confused with these messages too.  As you pointed
out, the different serial numbers imply that the audit_context is NULL
and if the audit_context is NULL I would have expected it to fail the
audit_dummy_context() check in audit_ntp_log().  I'm looking at this
with tired eyes at the moment, so I'm likely missing something, but I
just don't see it right now ...

What is even more confusing is that I don't see this issue on my test systems.

> Checking audit_enabled should not be necessary but might fix the
> problem, but still not explain why we're getting these records.

I'd like to understand why this is happening before we start changing the code.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
