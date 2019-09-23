Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F0BBBE5
	for <lists+linux-audit@lfdr.de>; Mon, 23 Sep 2019 20:57:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A60C3091740;
	Mon, 23 Sep 2019 18:57:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C48460166;
	Mon, 23 Sep 2019 18:57:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B2364E58A;
	Mon, 23 Sep 2019 18:57:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8NIvP4Q024733 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 14:57:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1978B5D721; Mon, 23 Sep 2019 18:57:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 143425D71C
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 18:57:22 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F7BC3084051
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 18:57:21 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id 72so10974830lfh.6
	for <linux-audit@redhat.com>; Mon, 23 Sep 2019 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m4tgrGihcnnMxK6tf6Ms9qDSNmgdGrksSS0BVGhZJ1E=;
	b=Vuc1VnR62B0oJl7jXHhRX8MAVLKvNBiajFdnjcYaVEXV3zkbWaM41bUU65zSidpphj
	AFtRxoPEXlYYkxXyhY4G/F3+iRAwwazFEeMQhd6OVQBcQjfnpblE6Gm7J7meV5zhyaSf
	S6YgEHu8qww8SMXXeagBNtQG40LQYJEKFX3yGo/qxZGmigy/UmtnAEgo0pehtVcFZvgq
	zQJKaNihjd8Fai1gUZNGbmujWFLCbQoI/SuhivlbZ9NLou1tNbAywYyxCYSwYnZsSjxg
	j6bkz6shsdU32J3Gpg72zzy4oDhGL4cbNn8qmXAq+RcA+4teL+kn3akE0mzmYFnQVpWo
	mpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m4tgrGihcnnMxK6tf6Ms9qDSNmgdGrksSS0BVGhZJ1E=;
	b=DRCJC+/xcXmlsUYofG4a4Sykwnn6eUX4IqQZKYjra/8w/CyB6cmjB7q/jCSaGDK1Uy
	5JzZlO102jP8lSaR6ftIoNEmA5N1Y7uapjS4/fVjpNm/Jp/HFBDCCMADCD3EkbhgAUh5
	oz6hpFlPZ3Rek2egeqodNvLioyKiWYOekRqEk3GCjqwBuq1ogUKSF/7KbI5BRvDw5Ngk
	TVjx5b3T+ACzZY9Snzew3Cme62slDmFAb75TDxqYv4TtdKpMG+kyv4EbArtq+Yus+3K9
	Z1PPy/F712L54V+1Xk7A092McH4MH7qSNa+SZGGkJvZsBMmXz8pClL1gI/NG8hsRm44+
	2Vww==
X-Gm-Message-State: APjAAAVYeS49eiI+3uOjlZYCxbr62zQiXAv1yk9HHdP0AqVaxoeTD0e1
	/pD/s86MdXaaAXIJqREEbnZwWZl+ZUK7unJvADab
X-Google-Smtp-Source: APXvYqz62ERe3OcFIvZ8Et5y7TEm9J0tpiQKpmff5I+9uZaO1+QV0ygNSEhKjPeF1/zs3jlKJGUih5RmbOY0CzZceY4=
X-Received: by 2002:a05:6512:202:: with SMTP id
	a2mr590505lfo.175.1569265039864; 
	Mon, 23 Sep 2019 11:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190923155041.GA14807@codemonkey.org.uk>
	<CAHC9VhTyz7fd+iQaymVXUGFe3ZA5Z_WkJeY_snDYiZ9GP6gCOA@mail.gmail.com>
	<20190923165806.GA21466@codemonkey.org.uk>
In-Reply-To: <20190923165806.GA21466@codemonkey.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 23 Sep 2019 14:57:08 -0400
Message-ID: <CAHC9VhTh+cD5pkb8JAHnG1wa9-UgivSb7+-yjjYaD+6vhyYKjA@mail.gmail.com>
Subject: Re: ntp audit spew.
To: Dave Jones <davej@codemonkey.org.uk>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 23 Sep 2019 18:57:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 23 Sep 2019 18:57:22 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com 209.85.167.67
	mail-lf1-f67.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 23 Sep 2019 18:57:44 +0000 (UTC)

On Mon, Sep 23, 2019 at 12:58 PM Dave Jones <davej@codemonkey.org.uk> wrote:
> On Mon, Sep 23, 2019 at 12:14:14PM -0400, Paul Moore wrote:
>  > On Mon, Sep 23, 2019 at 11:50 AM Dave Jones <davej@codemonkey.org.uk> wrote:
>  > >
>  > > I have some hosts that are constantly spewing audit messages like so:
>  > >
>  > > [46897.591182] audit: type=1333 audit(1569250288.663:220): op=offset old=2543677901372 new=2980866217213
>  > > [46897.591184] audit: type=1333 audit(1569250288.663:221): op=freq old=-2443166611284 new=-2436281764244
>  > > [48850.604005] audit: type=1333 audit(1569252241.675:222): op=offset old=1850302393317 new=3190241577926
>  > > [48850.604008] audit: type=1333 audit(1569252241.675:223): op=freq old=-2436281764244 new=-2413071187316
>  > > [49926.567270] audit: type=1333 audit(1569253317.638:224): op=offset old=2453141035832 new=2372389610455
>  > > [49926.567273] audit: type=1333 audit(1569253317.638:225): op=freq old=-2413071187316 new=-2403561671476
>  > >
>  > > This gets emitted every time ntp makes an adjustment, which is apparently very frequent on some hosts.
>  > >
>  > >
>  > > Audit isn't even enabled on these machines.
>  > >
>  > > # auditctl -l
>  > > No rules
>  >
>  > What happens when you run 'auditctl -a never,task'?  That *should*
>  > silence those messages as the audit_ntp_log() function has the
>  > requisite audit_dummy_context() check.
>
> They still get emitted.
>
>  > FWIW, this is the distro
>  > default for many (most? all?) distros; for example, check
>  > /etc/audit/audit.rules on a stock Fedora system.
>
> As these machines aren't using audit, they aren't running auditd either.
> Essentially: nothing enables audit, but the kernel side continues to log
> ntp regardless (no other audit messages seem to do this).

What does your kernel command line look like?  Do you have "audit=1"
somewhere in there?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
