Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CDE9C214D7A
	for <lists+linux-audit@lfdr.de>; Sun,  5 Jul 2020 17:11:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-PlOA19EGNieLu4-YY953TA-1; Sun, 05 Jul 2020 11:11:37 -0400
X-MC-Unique: PlOA19EGNieLu4-YY953TA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB48107ACCA;
	Sun,  5 Jul 2020 15:11:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5496474193;
	Sun,  5 Jul 2020 15:11:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BD6B1809547;
	Sun,  5 Jul 2020 15:11:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065FBUKv028494 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 11:11:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2897175AE; Sun,  5 Jul 2020 15:11:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6301132C
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 874A71033657
	for <linux-audit@redhat.com>; Sun,  5 Jul 2020 15:11:26 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-RI2nfqBUPyS8B0xgKo6C2w-1; Sun, 05 Jul 2020 11:11:24 -0400
X-MC-Unique: RI2nfqBUPyS8B0xgKo6C2w-1
Received: by mail-ej1-f66.google.com with SMTP id rk21so39777209ejb.2
	for <linux-audit@redhat.com>; Sun, 05 Jul 2020 08:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2tHsNsc85oEMgxfMe/9ECsv9KY90m64bzbMRR9357CU=;
	b=pnt6gQym4c6GrF8y8ooZnuq0SzA/amerM/2neGP7d0xK9cq3PboveGwvdRWVq+Vucq
	5aQy2CN3hVEXzB++C9kNGF8RUGN7O/jM58ua9SoPl0eht85FjBpq4t6WWh3a3CLbc+0j
	n0CZpiX7Ltjvt1sEWRwZSKZL+ITmLRvfN9Mydn+lGtJxlzgpimaMjbi8UBDTvlomEamG
	P/3avcz6eDYr1LXD9XLSEkjDLbfwFouMaj9MiRry2pJrvrU4ILGimphW45erDhPkz3Xs
	0Zpdbo6kXcqvoNidQ4//P/DRMvSS4KPtoM0FDeXy3wV2uJ2i2NbOA3ARQcPmvwSIcv6M
	COXA==
X-Gm-Message-State: AOAM532f9BPb583sFJp9Ov1vvZPh/lTO8f86JdHFpHYPum5sb8YSGNIx
	YzglkoiCBl1eLN3pUPVN1/hqKvU/GY77rbH8SHa2
X-Google-Smtp-Source: ABdhPJykYYlS6DyRXswVmWtbu7A3Q6Dy8mVKkx1CmIV5P5PACrs0bkv1logTfFs6fMkOIf3NdUb1tBevQz1LKf/qCoI=
X-Received: by 2002:a17:906:aac9:: with SMTP id
	kt9mr36448175ejb.488.1593961882949; 
	Sun, 05 Jul 2020 08:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<4a5019ed3cfab416aeb6549b791ac6d8cc9fb8b7.1593198710.git.rgb@redhat.com>
In-Reply-To: <4a5019ed3cfab416aeb6549b791ac6d8cc9fb8b7.1593198710.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 5 Jul 2020 11:11:11 -0400
Message-ID: <CAHC9VhSwMEZrq0dnaXmPi=bu0NgUtWPuw-2UGDrQa6TwxWkZtw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 08/13] audit: add containerid support for user
	records
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 27, 2020 at 9:23 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Add audit container identifier auxiliary record to user event standalone
> records.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  kernel/audit.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 54dd2cb69402..997c34178ee8 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -1507,6 +1504,14 @@ static int audit_receive_msg(struct sk_buff *skb, struct nlmsghdr *nlh)
>                                 audit_log_n_untrustedstring(ab, str, data_len);
>                         }
>                         audit_log_end(ab);
> +                       rcu_read_lock();
> +                       cont = _audit_contobj_get(current);
> +                       rcu_read_unlock();
> +                       audit_log_container_id(context, cont);
> +                       rcu_read_lock();
> +                       _audit_contobj_put(cont);
> +                       rcu_read_unlock();
> +                       audit_free_context(context);

I haven't searched the entire patchset, but it seems like the pattern
above happens a couple of times in this patchset, yes?  If so would it
make sense to wrap the above get/log/put in a helper function?

Not a big deal either way, I'm pretty neutral on it at this point in
the patchset but thought it might be worth mentioning in case you
noticed the same and were on the fence.

--
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

