Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE779EB5D
	for <lists+linux-audit@lfdr.de>; Tue, 27 Aug 2019 16:43:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0D4410F240C;
	Tue, 27 Aug 2019 14:43:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E874264027;
	Tue, 27 Aug 2019 14:43:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4410524F32;
	Tue, 27 Aug 2019 14:43:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7REhkNA025743 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 10:43:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54F73A212; Tue, 27 Aug 2019 14:43:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1415326FD9
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 14:43:45 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D7393082133
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 14:43:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id z17so18771087ljz.0
	for <linux-audit@redhat.com>; Tue, 27 Aug 2019 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=YkfB/z29520LEwzatah9n2e0+t1jEi1VDscgTCXP/DU=;
	b=enpYZIpHI1x2kcim2TrkqK1KS+m1wotcNGMKLMKbfd45peKUUD+6ZyXdr0UrM6nIr/
	7mV+Gq4+4g0ZmDJqPrzhRLzSh3xNgVmRxOAl8LPt1qhwMGuXgxWgUiG5zoAQte7Eas4W
	SU8849VAROTA55dDryc9RWyyecUsEuKIw3GoEPAcrL27AvRrUiZAwqzP6csbm4KQZOce
	7hN9UFXb3nYbEc3Q/kwcg0YHtp53BasMOPSDfGs/LTzlQFovM0apSBIwMo4SOBaRwWnc
	ULNI8HH8we2dgIUZ7lrE+zuJT/2X8pdtNaSZPqQQNLK6j8Z71NmMfwuUzlOua8ThHetR
	5fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=YkfB/z29520LEwzatah9n2e0+t1jEi1VDscgTCXP/DU=;
	b=UTb0sKFGao3OyJcPP5EEOZETC0Na6Dp4U1Pol9+p08GUtU6N0YTmWy6h5lmffVouAT
	75njPiJ6Br4Odk5C6lhxBc8iaEjYH2drC1oA80lXtIdwPN9ndkAAFDL0ISthJg69mIiV
	EzWQxDkbv4HUPquVsb7wAXR+ny0Q+z3xCakyEJnglBPbcETJQwptaTL/JV/hpUu4ncBH
	eFrUbNOwiQcpuhbcJ3551mxFNiIiMriduLtMQ89O00TqjH1jmOjc+nEtthDXhWNfYLrp
	8bqsEGWMEIRSwtlJf2LGoxHyzx5B4S7QoeZLGEVUCKtd+qk8FQ6/DhPmwJXI4Svff4m9
	88uA==
X-Gm-Message-State: APjAAAXOUarv69wRdvo1d7N5BQWzabdEmYbcXY3u2cVwdwYw9Is84q7D
	+9qGZ9XW5uR5DaUEni2Tw20U7WgclWmHh5XO88+G8UzWMQ==
X-Google-Smtp-Source: APXvYqziJcXlyFilg7Bd6DAhv/9UW4pPhNhSY8HBjXb+BaF9QwIi3bOHJAp+1nkC+y10tVbaxNY4va2jbTWhLZ0BJoc=
X-Received: by 2002:a2e:6393:: with SMTP id s19mr13646760lje.46.1566917023164; 
	Tue, 27 Aug 2019 07:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <156691675641.16819.16469111001334328114.stgit@chester>
In-Reply-To: <156691675641.16819.16469111001334328114.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 27 Aug 2019 10:43:31 -0400
Message-ID: <CAHC9VhS+uQbvDh65JtCxmz2XFb-AushQmP4fJHkoCsdKiPeoxw@mail.gmail.com>
Subject: Re: [PATCH] audit-testsuite: update the docs for Debian SID/unstable
To: linux-audit@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 27 Aug 2019 14:43:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 27 Aug 2019 14:43:45 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Tue, 27 Aug 2019 14:43:53 +0000 (UTC)

On Tue, Aug 27, 2019 at 10:39 AM Paul Moore <paul@paul-moore.com> wrote:
> From: Paul Moore <paul@paul-moore.com>
>
> Updates include additional packages and instructions on changing
> /bin/sh from Dash to BASH.
>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  README.md |   11 +++++++++++
>  1 file changed, 11 insertions(+)

As this is a trivial patch, I merged it without the usual one/two day delay.

> diff --git a/README.md b/README.md
> index bc20a21..0f6c861 100644
> --- a/README.md
> +++ b/README.md
> @@ -52,12 +52,23 @@ please follow the instructions below.
>
>  ### Debian Based Systems
>
> +On Debian you need to install a number of dependencies as well as perform some
> +additional system configuration.  Install the dependencies using the commands
> +below:
> +
>         # apt-get install auditd \
>                           build-essential \
>                           libc6-i386 \
> +                         libc6-dev-i386 \
>                           perl-modules \
>                           netcat
>
> +After the dependencies are installed you should ensure that BASH is installed
> +on the system and that /bin/sh points to BASH, not Dash:
> +
> +       # apt-get install bash
> +       # dpkg-reconfigure dash
> +
>  ## Execution
>
>  Please notice that tests are changing kernel audit rules and hence it might be
>

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
