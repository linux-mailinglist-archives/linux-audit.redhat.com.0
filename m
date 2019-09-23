Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 95372BB94E
	for <lists+linux-audit@lfdr.de>; Mon, 23 Sep 2019 18:14:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F137D307D923;
	Mon, 23 Sep 2019 16:14:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D575C60BFB;
	Mon, 23 Sep 2019 16:14:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96C054EDA7;
	Mon, 23 Sep 2019 16:14:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NGEVOO013669 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 12:14:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6539C5D9E2; Mon, 23 Sep 2019 16:14:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605685D9D5
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 16:14:28 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 449B73175281
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 16:14:27 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r2so10563183lfn.8
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/9wM70GeJDNUGZe5ZLnpg6WVa1oWcgg26Mn74A2MeDw=;
	b=riX/7Yuy0Xbn3hi0u9kl91tN7pbLNX5VzV9CZtxq96y6hfb5qc8xynkUeTiddv9feI
	pGZouRHLz520odaH3C4i5eHcOSU2wmlZUaf/qY0dHC6KhT7T1e+X3e90ezDE21WFKixf
	sr2Yfd0PfwHvhqha2y7y8Irq5FJC1b1UQFSe5zrWLrGUALY7idJ5E+ASJmBUtZuF52CU
	j5CG26LnbkfD/rQhdtKkV0duufWoJHOL2tm4UsXlmYImXzAYTpHkqBfz+mn55cXPh5Eu
	E+y16McKF8A0X+k0OtVoVeHPFhxbfm4A9eIO826OLXfNf3WJIeIQuwNQLFUYoIgTavZ2
	VXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/9wM70GeJDNUGZe5ZLnpg6WVa1oWcgg26Mn74A2MeDw=;
	b=k0KXoIWPcLP2A8Kkfuu+ftsu2KGnIEtZnva9dCgrwh3hpSfyaiighKsP6T+4/VxUTo
	V1xp0JsczcHtzZQmGHLc0D37qX4hDHafAQEXkbj9xPwyqXpmUaEzdP7xChE2aIOLGXmt
	LMFK8NY8/xQHbtXvlnnoW3cJCmh0dECdPMap+HsV1ipPrgVRWW2cQE+3l+OwtjcrbjDY
	qPHn+g+Gitym4Sgw7SbbwxObaIbvW0rotwq6u47jtsHk9XECS6JgmIcUrTte2JNkrzKh
	ULGnF5BD0i9qLzFr1nZrOW472bvZYb+fJakzCxBCwyIoQLcnJI55HFJeKi2G0cTu7Q0j
	Si/g==
X-Gm-Message-State: APjAAAWzZ2pYg9EqEqIg+vUWDCDKxO9MvczaJA6v1gkr0eBasa+nRYqJ
	jB7T3sYpPhGQHllsAhDRce5ZGoAU5Kv+mqr7AW9p
X-Google-Smtp-Source: APXvYqwsZuFfFsvLiEx7OJoGaffrqtUPaoJCC4yACHsxjkUik2wKo5wKITCfe1sCIjGkA9P19uZ4KflJeEprpYXOUgo=
X-Received: by 2002:a05:6512:202:: with SMTP id
	a2mr209351lfo.175.1569255265495; 
	Mon, 23 Sep 2019 09:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
In-Reply-To: <20190923155041.GA14807@codemonkey.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Sep 2019 12:14:14 -0400
Message-ID: <CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Dave Jones <davej@codemonkey.org.uk>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 23 Sep 2019 16:14:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 23 Sep 2019 16:14:27 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, Linux Kernel <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 23 Sep 2019 16:14:53 +0000 (UTC)

On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
>
> I have some hosts that are constantly spewing audit messages like so:
>
> [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
> [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
> [48850.604005] audit: type=1333 audit(1569252241.675:222): op=offset old=1850302393317 new=3190241577926
> [48850.604008] audit: type=1333 audit(1569252241.675:223): op=freq old=-2436281764244 new=-2413071187316
> [49926.567270] audit: type=1333 audit(1569253317.638:224): op=offset old=2453141035832 new=2372389610455
> [49926.567273] audit: type=1333 audit(1569253317.638:225): op=freq old=-2413071187316 new=-2403561671476
>
> This gets emitted every time ntp makes an adjustment, which is apparently very frequent on some hosts.
>
>
> Audit isn't even enabled on these machines.
>
> # auditctl -l
> No rules

[NOTE: added linux-audit to the CC line]

There is an audit mailing list, please CC it when you have audit
concerns/questions/etc.

What happens when you run 'auditctl -a never,task'?  That *should*
silence those messages as the audit_ntp_log() function has the
requisite audit_dummy_context() check.  FWIW, this is the distro
default for many (most? all?) distros; for example, check
/etc/audit/audit.rules on a stock Fedora system.  A more selective
configuration could simply exclude the TIME_ADJNTPVAL record (type
1333) from the records that the kernel emits.

We could also add a audit_enabled check at the top of
audit_ntp_log()/__audit_ntp_log(), but I imagine some of that depends
on the various security requirements (they can be bizzare and I can't
say I'm up to date on all those - Steve Grubb should be able to
comment on that).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
