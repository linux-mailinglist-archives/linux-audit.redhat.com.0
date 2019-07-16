Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76D6B240
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 01:14:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C12EA37F46;
	Tue, 16 Jul 2019 23:14:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9440A5D968;
	Tue, 16 Jul 2019 23:14:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03F1E4EA31;
	Tue, 16 Jul 2019 23:14:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GNEAMo005324 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 19:14:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B35B75C266; Tue, 16 Jul 2019 23:14:10 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1D45C220
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:14:08 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A756F3082199
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 23:14:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z28so21707874ljn.4
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 16:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Bd5Qq9nLF54vSE2ZtollGcnD2iIGwl8u2ADzpQ1DYA=;
	b=OZv744opL0MsApSsRmeJVqQX8BYqeu8jV35rFM/9rEg7s3qoSdTWxjCi5xMSjhdPH8
	UcE3Op4Sc+eo+6C6fb+c8PCwhZC1n5lXvyx//PRZrGZuBfzu6h/5BfDbgO5Rj4LvXPHR
	KtLKG7ChddVPv1QkD44NYQOvMKScwn0INthD1dxcS6LoK6N4UvUhRZVjntLBKeQ6fMEp
	/XP2VAkVaKY8NUZ9gX2EDJbbapmWpv1/bzfaEpr0a5tdXmP3QX2heRgklGRfVgblKfda
	GRezAUbFTStuGKYGdxEbC/KS5m4vEQU7PfiBaZEO09qNS5m5oJuYlOi9h2HH54E+sNrQ
	Ooog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Bd5Qq9nLF54vSE2ZtollGcnD2iIGwl8u2ADzpQ1DYA=;
	b=lc2fnY9tCKWIt4CikmhOXwk7IYmpo4Y5/gSV9YhqQNiHs4CVLL40/Lj7hEavOJ/nyY
	f4v40qfHg8bRe3cftDiSj+JCv/XXrPiwqlswl6xwTXq+jnGaXB9Y5L0+AU9xe9kxoaus
	iyCX/rp90MddyqE11FaPsDSgwdDSCLSEZWX3LatgQ9e6B8ksO6C161mBqDWLfZbLuHk5
	p/Ly91/DmGmlEqM+Heprxiekhk73bevmWJABuK1n2dik/OrKWDyNohXE7B2PDk5lkTnq
	LDaaeIVeRL+zA1K//fnqN3CjXsfHAlhCnYDdHizCEHNjDTY1k1rvhFmZCu6TQdzzozLf
	Sd7A==
X-Gm-Message-State: APjAAAXT29keJazLJNbCQa4bMENfQAyHyMP9G/uSLowiYSNxBXpIp9v0
	0qbkVleD4opqdOqtoWj6UFwMvy4eyQtNftws5A==
X-Google-Smtp-Source: APXvYqyuzAElHMYoAnpdQpmhpzt+MZGUlfyqihr2+6WE/dmLzZgr+rjj+LTkcGwMs9DGUI6WPn/xR0cd0E4G9bn882g=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr19147241ljj.0.1563318845975;
	Tue, 16 Jul 2019 16:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
In-Reply-To: <27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 19:13:54 -0400
Message-ID: <CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 16 Jul 2019 23:14:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 16 Jul 2019 23:14:07 +0000 (UTC) for IP:'209.85.208.169'
	DOMAIN:'mail-lj1-f169.google.com'
	HELO:'mail-lj1-f169.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.169 mail-lj1-f169.google.com 209.85.208.169
	mail-lj1-f169.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 16 Jul 2019 23:14:16 +0000 (UTC)

On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> It sounds as if some variant of the Hideous format:
>
>         subj=selinux='a:b:c:d',apparmor='z'
>         subj=selinux/a:b:c:d/apparmor/z
>         subj=(selinux)a:b:c:d/(apparmor)z
>
> would meet Steve's searchability requirements, but with significant
> parsing performance penalties.

I think "hideous format" sums it up nicely.  Whatever we choose here
we are likely going to be stuck with for some time and I'm near to
100% that multiplexing the labels onto a single field is going to be a
disaster.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
