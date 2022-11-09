Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84598623785
	for <lists+linux-audit@lfdr.de>; Thu, 10 Nov 2022 00:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668036882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m0bcTuNu0RaE5g1SPmoG3EbQxVpHTbkKGI0FlpZcDEI=;
	b=EsKzGVNuPtE8KsDfgtqVKvtlbNuc6Av44BbDwUYuXY0qfEmvP69jsB9k0Pt1jhtPnpWa/r
	KRvCGrh5kXfQJto71hkQXfWRLeSgK+CU5X0bI/hFLgqwtz4iFysFYtGB4AyL4IKWIo+gR1
	Mmmc9WmKcdV41HuZegNgYLnNpOooQYY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-hXyiBUHyMSy5xXHrHrBdww-1; Wed, 09 Nov 2022 18:34:38 -0500
X-MC-Unique: hXyiBUHyMSy5xXHrHrBdww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 925C81C004F5;
	Wed,  9 Nov 2022 23:34:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D45B140D298B;
	Wed,  9 Nov 2022 23:34:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BAEC119465B7;
	Wed,  9 Nov 2022 23:34:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 03E831946588 for <linux-audit@listman.corp.redhat.com>;
 Wed,  9 Nov 2022 23:34:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB880140EBF5; Wed,  9 Nov 2022 23:34:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D44B91402BDA
 for <linux-audit@redhat.com>; Wed,  9 Nov 2022 23:34:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E6585A5A6
 for <linux-audit@redhat.com>; Wed,  9 Nov 2022 23:34:27 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-h2gXRquhObqvaX0MGmeS_g-1; Wed, 09 Nov 2022 18:34:25 -0500
X-MC-Unique: h2gXRquhObqvaX0MGmeS_g-1
Received: by mail-ot1-f43.google.com with SMTP id
 cb2-20020a056830618200b00661b6e5dcd8so257912otb.8
 for <linux-audit@redhat.com>; Wed, 09 Nov 2022 15:34:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sWbjRDR7oEfTFipQemNFQRb8BL0viMnAylQw4SRSH5I=;
 b=3yBZ74UV8OS2KXDrGMsm8y3JFfGNexWVWShFD+tjfLE+7cE2+qfHFpwVyhV1ZFr7qn
 mWuY3RL3f1G5TnRsTvgjWODK79qkzTRLf+olNNsol3IWlYDkJJo2VoDvmBNGkA/pG8Na
 7dk2/96xKB++LBElSvnjB8szKSrtdOeDuImjf0qo6cuO7nrIMzmZCHpWVcRLn4bDFVoD
 oKm9vZVcoZQyW+zZxNJjjArr44qvmA2vknQVcVgV1H4LxE2nQccl1F/xJcilkt66W1eG
 XF9D7dqXRNVF2+/cupXms75K9y88DXG3b07fqBevBKuSN46jXNipr4KtK6bJvFOB28Q+
 A9iQ==
X-Gm-Message-State: ACrzQf2xaDK8R1hyTaB/yUjEpLtvMjZQKgGPZwlTUnuyVQfUXodTc/Sp
 sp8Cqb0tIcvcw7nDEwvN/e1jDbkCxaKTAavH2mLv
X-Google-Smtp-Source: AMsMyM6EYxXXLjYag46U/qRTjGODzHhgNYuenbATBWMFT4HBwhpOqAzYqwjgoyxzBTRIst+9dQ4yGQPsJ1j8jnyqcT4=
X-Received: by 2002:a9d:7f84:0:b0:66c:53ef:e555 with SMTP id
 t4-20020a9d7f84000000b0066c53efe555mr25368433otp.34.1668036864745; Wed, 09
 Nov 2022 15:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20221025184519.13231-1-casey@schaufler-ca.com>
 <20221025184519.13231-5-casey@schaufler-ca.com> <Y1jNGMKfb+NUPrJS@kroah.com>
 <e3949b66-26fe-807e-a626-79ca78396e8a@schaufler-ca.com>
In-Reply-To: <e3949b66-26fe-807e-a626-79ca78396e8a@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Nov 2022 18:34:14 -0500
Message-ID: <CAHC9VhQzP0Fz4O9dJLy2hQrMK-2gDjEDBsJw=-2Fvr9jiva1Hg@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] LSM: Maintain a table of LSM attribute data
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 26, 2022 at 8:38 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 10/25/2022 11:00 PM, Greg KH wrote:
> > On Tue, Oct 25, 2022 at 11:45:15AM -0700, Casey Schaufler wrote:
> >> As LSMs are registered add their lsm_id pointers to a table.
> >> This will be used later for attribute reporting.
> >>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> ---
> >>  include/linux/security.h | 17 +++++++++++++++++
> >>  security/security.c      | 18 ++++++++++++++++++
> >>  2 files changed, 35 insertions(+)
> >>
> >> diff --git a/include/linux/security.h b/include/linux/security.h
> >> index ca1b7109c0db..e1678594d983 100644
> >> --- a/include/linux/security.h
> >> +++ b/include/linux/security.h
> >> @@ -138,6 +138,23 @@ enum lockdown_reason {
> >>
> >>  extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
> >>
> >> +#define LSMID_ENTRIES ( \
> >> +    1 + /* capabilities */ \
> > No #define for capabilities?
>
> Nope. There isn't one. CONFIG_SECURITY takes care of it.

I guess we might as well use the existing pattern just in case this
header ever gets pulled into somewhere unexpected.

  (IS_ENABLED(CONFIG_SECURITY) ? 1 : 0) + ...

--
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

