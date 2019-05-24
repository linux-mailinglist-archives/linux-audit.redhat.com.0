Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF528E81
	for <lists+linux-audit@lfdr.de>; Fri, 24 May 2019 03:07:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64BA9C0578C4;
	Fri, 24 May 2019 01:07:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 939F568396;
	Fri, 24 May 2019 01:07:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D34B5B424;
	Fri, 24 May 2019 01:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4O16iX5018463 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 21:06:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0E436090E; Fri, 24 May 2019 01:06:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BADEB67E64
	for <linux-audit@redhat.com>; Fri, 24 May 2019 01:06:42 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E9B9356F1
	for <linux-audit@redhat.com>; Fri, 24 May 2019 01:06:41 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id n22so5749072lfe.12
	for <linux-audit@redhat.com>; Thu, 23 May 2019 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZplnxF6a0l7LAz3WV8CaYU4jLmaJGe0puEchg/rxDi8=;
	b=POwLZaZlMqAdyE/tyiUUCp0c50NKGLedztM2agQw/vx4cadHmoi5X09RlW7Uu7Oveb
	7qtU3lWJDv5I/E10VuLYVg9+AgNn81Vt6DovGd8sVidFqoYevcHY6H/oneIq0rkCDYAs
	WSuOjM5AJsXJio58yA4eFK/1AeulL//A3NGL+z93SOxmFKUInlaJcHKJi5cLUNiMfcTc
	eECOfvfpccFgDawlHOStO5FEqXhKx83zTXxueKDWN251gXYS090PWOnAjcLAUoMiorUr
	iRKEXAYogBF8AUW9aBKVLXXGGC6Flx4Xkc0LhcqA8F0uruVdJpXgXlalmTRNeh86inHw
	wfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZplnxF6a0l7LAz3WV8CaYU4jLmaJGe0puEchg/rxDi8=;
	b=hkyD/gXRKj20oSVy1IEis46oYZM3cvGbsMI8wdOSleHunPtpAirbr6EgN6R5zAQeKR
	f/+dCndcJHE0y1WghR0tt1wiY+i+vuJNcO+ZxApLEAdYaQJ3DQs72hWj0KM6CpOmxcQm
	gBFabGEdnjQjkiwdEk6O/+6tgkVpjk9wmHf6LMRhmwhCst/ReszOWhmUZ61VhEoaxmNu
	bmt7dfI4/RiQEDQny1uqH79A/wsG6nnksu5+kXHyaaTL8bkCKgmfAWigC3KDIxqUQhDW
	h1XR4gz+GKXgajSdu8l4XHIARnCwH5ilK44ckzENRlPcg1kKz32Z2lPJgVc4tCIjIrfB
	Mj0g==
X-Gm-Message-State: APjAAAVAUMbtTVNEkrvxk4j8Y+04FKyZxEjHaCXIH1l3ifiRjHw5uhWY
	8daf2iZ5fvho0ZmYYlFZ6SKxN/uMPg6E29zZ9FCJ/b3a2Q==
X-Google-Smtp-Source: APXvYqxCdGGLTgBGimV+AbO1mtjUb3B+zJzPsyq0IMtLWpCihEfSVhvfR7gZB845qDiZDxQyvPFMOVa4kvswXLAedaI=
X-Received: by 2002:ac2:54af:: with SMTP id w15mr4790209lfk.8.1558659999470;
	Thu, 23 May 2019 18:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <37cc1e38c08ca129f43891b3cd521e6daeb5f342.1558553120.git.rgb@redhat.com>
In-Reply-To: <37cc1e38c08ca129f43891b3cd521e6daeb5f342.1558553120.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 May 2019 21:06:28 -0400
Message-ID: <CAHC9VhSt3AZZh+VD9JH5K2FU6HAHw-CcYdYPTr03Ed+WQA_ukA@mail.gmail.com>
Subject: Re: [PATCH ghak73 V3] audit: re-structure audit field valid checks
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 01:06:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 24 May 2019 01:06:41 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.444  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 24 May 2019 01:07:08 +0000 (UTC)

On Wed, May 22, 2019 at 5:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Multiple checks were being done in one switch case statement that
> started to cause some redundancies and awkward exceptions.  Separate the
> valid field and op check from the select valid values checks.
>
> Enforce the elimination of meaningless bitwise and greater/lessthan
> checks on string fields and other fields with unrelated scalar values.
>
> Please see the github issue
> https://github.com/linux-audit/audit-kernel/issues/73
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v3:
> - remove op negation for WATCH, DIR, PERM, FILETYPE (ghak114)
> - move AUDIT_{SUBJ_{CLR,SEN},OBJ_LEV_{LOW,HIGH}} to range
> v2:
> - address WATCH, DIR, FILETYPE, PERM lack of op checking
> - touch up switch statement formatting
>
>  kernel/auditfilter.c | 56 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 34 insertions(+), 22 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
