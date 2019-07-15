Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08D69E58
	for <lists+linux-audit@lfdr.de>; Mon, 15 Jul 2019 23:29:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F16436883;
	Mon, 15 Jul 2019 21:29:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1087F6085B;
	Mon, 15 Jul 2019 21:29:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 759F918033A0;
	Mon, 15 Jul 2019 21:29:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6FLTD8A022604 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jul 2019 17:29:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E745D19C59; Mon, 15 Jul 2019 21:29:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F6D19C68
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:29:10 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B08385376
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 21:29:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x25so17787734ljh.2
	for <linux-audit@redhat.com>; Mon, 15 Jul 2019 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lH0ilMsPvEsTZwGkYjGPBLQ8MujKloGNsDszsbL7WYI=;
	b=N5nyhHwhwA2oU5hxixZqFCRLElBSqzKoxoW8AwKlQ3RosvQyOpDqjKolZvgeKJsRFI
	vLn8Q048Si5rItc1f/lxbPXtYHKOtDDt5rppKmmAjZAmW0MpEyv7dhpQgbKeyuhXIeXj
	6NZs7MpiyrjtfObKdprhNwFxYmUnORmTzf+Z6qUHMOjFgJS6TNT2STwm/xsQzhzi6b7u
	0oNTl50bzG/nwU1HU3WGugrParpNRaZnQit9NP36T3P144WCk+ryik8CmRFKawY8fGW4
	rS0SuVC5SSpw4lJES9qGmeNIiQY9hoqElR/K49ZI0P3CS7mM5f5zh7d2Ib+pEl3khVlw
	TNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lH0ilMsPvEsTZwGkYjGPBLQ8MujKloGNsDszsbL7WYI=;
	b=JCSUd7+5LiZ3QuTbibXwu5WYRB+NJTw3kUv9AxEBe8+M51TxqUTWhFyimZafCfS2ic
	7LHcdUUfXBDFDlhv9jYDBpXJQWDBbmDvYb5kGRnHCTK4AYdjzj9WikxfWo779cO7BD0B
	vsmF1e6fSaLDNJNlSkkoJoozM/vtt1Qi5/HzzshOx4YOHp/xENHPTAV9KVjlXD0FjFUJ
	59qzt+9Sg+HVaXbOuLZxTNDoHlHXWlFC4zNkJMX0RX90wkeDo2FCzgc1DIXMAUR5yGqh
	nRTjeDnokwIzQ0/BiV+kcYXAuZ6h93R1x/ETvQHbaSQgjSvqgWIXiU8d/UkmBLnXvs2F
	3Sqw==
X-Gm-Message-State: APjAAAUdIezfxvbLtTptr3igjetBYLGiaeAxSITHsldmh+ib0cTWpP1M
	eplq+3mJlatRYccGu/LKmZXcstqOdhb9PnSjhw==
X-Google-Smtp-Source: APXvYqwmoPEY7eCVnOT7M4LK3oo0XfA45eJpM0PdtAbre1sPeEPwbPsVY03A+ABokEsU4i2wysAC9RlPg8244pCLGYg=
X-Received: by 2002:a2e:3807:: with SMTP id f7mr2151378lja.87.1563226147496;
	Mon, 15 Jul 2019 14:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<2268017.8MBUnBNn7u@x2>
	<20190715190457.pqlaxjcxhdcosdsz@madcap2.tricolour.ca>
	<c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
In-Reply-To: <c46932ec-e38e-ba15-7ceb-70e0fe0ef5dc@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jul 2019 17:28:56 -0400
Message-ID: <CAHC9VhQ08LKUmYS8ho_0-uDUFakPPq1bvR6JwWiLUrnwaRV6Aw@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>, Steve Grubb <sgrubb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 15 Jul 2019 21:29:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 15 Jul 2019 21:29:09 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 15 Jul 2019 21:29:23 +0000 (UTC)

On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> > On 2019-07-13 11:08, Steve Grubb wrote:
> >> Hello,
> >>
> >> On Friday, July 12, 2019 12:33:55 PM EDT Casey Schaufler wrote:
> >>> Which of these options would be preferred for audit records
> >>> when there are multiple active security modules?
> >> I'd like to start out with what is the underlying problem that results in
> >> this? For example, we have pam. It has multiple modules each having a vote.
> >> If a module votes no, then we need to know who voted no and maybe why. We
> >> normally do not need to know who voted yes.
> >>
> >> So, in a stacked situation, shouldn't each module make its own event, if
> >> required, just like pam? And then log the attributes as it knows them? Also,
> >> what model is being used? Does first module voting no end access voting? Or
> >> does each module get a vote even if one has already said no?
> >>
> >> Also, we try to keep LSM subsystems separated by record type numbers. So,
> >> apparmour and selinux events are entirely different record numbers and
> >> formats. Combining everything into one record is going to be problematic for
> >> reporting.
> > I was wrestling with the options below and was uncomfortable with all of
> > them because none of them was guaranteed not to break existing parsers.
>
> I too, am uncomfortable regarding record parsing.

If you can find me someone who is happy and comfortable with the
current state of the audit record and/or formatting I would love to
see them :)

> > Steve's answer is the obvious one, ideally allocating a seperate range
> > to each LSM with each message type having its own well defined format.
>
> It doesn't address the issue of success records, or records
> generated outside the security modules.

Yes, exactly.  The individual LSM will presumably will continue to
generate their own audit records as they do today and I would imagine
that the subject and object fields could remain as they do today for
the LSM specific records.

The trick is the other records which are not LSM specific but still
want to include subject and/or object information.  Unfortunately we
are stuck with some tough limitations given the current audit record
format and Steve's audit userspace tools; I can toss out some
suggestions but it would be nice to hear what Steve's tools would
support with respect to LSM subject/object value formats.  Steve, are
these values interpreted at all by your tools, or are the opaque
values?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
