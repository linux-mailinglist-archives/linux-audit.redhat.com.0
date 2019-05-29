Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6232E803
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:17:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 451703E2B7;
	Wed, 29 May 2019 22:17:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D63560BF0;
	Wed, 29 May 2019 22:17:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54B688E1F;
	Wed, 29 May 2019 22:17:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMGfZr006801 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:16:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A61DF7A44B; Wed, 29 May 2019 22:16:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A04507A462
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:16:39 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A436F3082132
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:16:30 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m22so3864071ljc.3
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Oz7cGsD/P4AYjrQuzbhSqhrqwPvDYoZyUjrCxUd5apo=;
	b=W488NziPak7bX8NLwk8X91sVgaISEiHHggxPCEy5FTn4IJfjT1bBLLNUdZubDFWtPH
	7KoVKeHGWUJXYe/3LbLZBn7H5JwyXSUSceIdUccTOeecjr9Rha/esMd2v5J0QgIJpV+r
	w04dPFkQRPrhrAhVz6CVOLfdZR28+WrUYuPXRMr/nyIluc9YhOFeRWVGdDt44wALPWrq
	PIABiusmnwb5q3e6jTuVcyQq9WGF/T14PHNRDSG8TQJ0AL3qJIxSz6hon1W/8m1HgZoD
	RpTG7XBD0QK5YboiITTVwFV0joTjp8gpqwSWpkPmVhJkcpSP6IsYCYIr59Rl1ujOgBWb
	A8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oz7cGsD/P4AYjrQuzbhSqhrqwPvDYoZyUjrCxUd5apo=;
	b=AVDbGgW5TNh70tB6lFj1B2nSNQMROpWY1DNiR1n6Kb9FvvzNcEPQtef6Krp8W9g76v
	uDfjoFLUS2dA08Hd5j+YkyX9aHp1D9S2y7sT1AaOVvXreRwSCaonicXpqaU5N77Se9U+
	fig40Zh0Qe73biAIvOdc6eYV1gh3xk2c87soLDoI/h0+HYFt5uCy3g0WWx87fLUq877m
	0NF2/Qnl7IRYEpUvjy72V0EUQsHZhSH1Q8oDoooZmOxfA0ayrfIVmbRoPPbIFd1gNsKe
	CMvRGoDo4HtXm+YRafZ2HofxRvfhQ5PY6nWg7tjE4g6DCOjD7A4rVNnnLHdSw2ZQStni
	a+HQ==
X-Gm-Message-State: APjAAAWkBFE3i27VJurH6cadGirv+XwVnqtMgCupaH6PSnS8L52IySof
	arJX0sUEPt9krieHoB9u0Vta3XPQgApcJsEk4IUI
X-Google-Smtp-Source: APXvYqzfNdl8873L36TO9hSNPPYmytZePE3WW4+a9ltLKODcsNQS6Y9bUNbWImIKz7mxDt4DEezNtHhuOjvLWIqNvZM=
X-Received: by 2002:a2e:3e14:: with SMTP id l20mr137436lja.40.1559168188869;
	Wed, 29 May 2019 15:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<0785ee2644804f3ec6af1243cc0dcf89709c1fd4.1554732921.git.rgb@redhat.com>
In-Reply-To: <0785ee2644804f3ec6af1243cc0dcf89709c1fd4.1554732921.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 18:16:18 -0400
Message-ID: <CAHC9VhRV-0LSEcRvPO1uXtKdpEQsaLZnBV3T=zcMTZPN5ugz5w@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 08/10] audit: add containerid filtering
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 29 May 2019 22:16:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 29 May 2019 22:16:31 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 29 May 2019 22:17:43 +0000 (UTC)

On Mon, Apr 8, 2019 at 11:41 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Implement audit container identifier filtering using the AUDIT_CONTID
> field name to send an 8-character string representing a u64 since the
> value field is only u32.
>
> Sending it as two u32 was considered, but gathering and comparing two
> fields was more complex.
>
> The feature indicator is AUDIT_FEATURE_BITMAP_CONTAINERID.
>
> Please see the github audit kernel issue for the contid filter feature:
>   https://github.com/linux-audit/audit-kernel/issues/91
> Please see the github audit userspace issue for filter additions:
>   https://github.com/linux-audit/audit-userspace/issues/40
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  include/linux/audit.h      |  1 +
>  include/uapi/linux/audit.h |  5 ++++-
>  kernel/audit.h             |  1 +
>  kernel/auditfilter.c       | 47 ++++++++++++++++++++++++++++++++++++++++++++++
>  kernel/auditsc.c           |  4 ++++
>  5 files changed, 57 insertions(+), 1 deletion(-)

...

> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index 63f8b3f26fab..407b5bb3b4c6 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -1206,6 +1224,31 @@ int audit_comparator(u32 left, u32 op, u32 right)
>         }
>  }
>
> +int audit_comparator64(u64 left, u32 op, u64 right)
> +{
> +       switch (op) {
> +       case Audit_equal:
> +               return (left == right);
> +       case Audit_not_equal:
> +               return (left != right);
> +       case Audit_lt:
> +               return (left < right);
> +       case Audit_le:
> +               return (left <= right);
> +       case Audit_gt:
> +               return (left > right);
> +       case Audit_ge:
> +               return (left >= right);
> +       case Audit_bitmask:
> +               return (left & right);
> +       case Audit_bittest:
> +               return ((left & right) == right);
> +       default:
> +               BUG();

A little birdy mentioned the BUG() here as a potential issue and while
I had ignored it in earlier patches because this is likely a
cut-n-paste from another audit comparator function, I took a closer
look this time.  It appears as though we will never have an invalid op
value as audit_data_to_entry()/audit_to_op() ensure that the op value
is a a known good value.  Removing the BUG() from all the audit
comparators is a separate issue, but I think it would be good to
remove it from this newly added comparator; keeping it so that we
return "0" in the default case seems reasoanble.

> +               return 0;
> +       }
> +}

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
