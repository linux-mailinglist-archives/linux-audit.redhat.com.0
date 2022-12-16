Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7024364F003
	for <lists+linux-audit@lfdr.de>; Fri, 16 Dec 2022 18:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671210341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qJc1EzPy1LQdGNbg0lhH+7NjkJBIPAL0ab4PqgW5sTc=;
	b=AGs8VQWe7SlmujXhj07yDyrvC2Und0cxEVuPLkzB/Y3ca/H1ysRpS/6m86zoUEO5GwnSpl
	lKfI1dMe1hKLSsmmY+DWYAgvxBSmY2l7o1GdmaAx+qDmFmvwQ7GCTN51B5ajlH4po+nJ9z
	RpqaPxOro7yRAiA3PLK77tf/0EktoUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-_vhnpiUPMZKhzPpGISoQbg-1; Fri, 16 Dec 2022 12:05:40 -0500
X-MC-Unique: _vhnpiUPMZKhzPpGISoQbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D3D2802BB3;
	Fri, 16 Dec 2022 17:05:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2C7D2166B2A;
	Fri, 16 Dec 2022 17:05:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 950171946A6E;
	Fri, 16 Dec 2022 17:05:30 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B72EF1946594 for <linux-audit@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 17:05:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 889471121318; Fri, 16 Dec 2022 17:05:28 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 819331121314
 for <linux-audit@redhat.com>; Fri, 16 Dec 2022 17:05:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59BCB88B7AA
 for <linux-audit@redhat.com>; Fri, 16 Dec 2022 17:05:28 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-NVj9DgHqNCKlXwnk58CJOw-1; Fri, 16 Dec 2022 12:05:26 -0500
X-MC-Unique: NVj9DgHqNCKlXwnk58CJOw-1
Received: by mail-pg1-f176.google.com with SMTP id s196so2192122pgs.3
 for <linux-audit@redhat.com>; Fri, 16 Dec 2022 09:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d6OCT2ZdbDad/BMX0pnYZXGlc+e0Af4ihyKy0ZnG13g=;
 b=1KyKjnDH4HSlwJFUhT41h3kqwoJEsgZA4EK0PmnNvp7RnZe4qgvpW1OyhYhT+PznzS
 H8ad0UpgpvGUSbA/du6gf7/yvCVoslQw9nyLO3JcUReKQn62wqvgvN4yC1jIdVjMCtri
 +xqP249r3JpB/10o51PDtLk2Eh53Lx44U3DzRj3vs5ZsT6Ajjh59EvRHPn5GYYB/zZa4
 vS/m363t9FjriFVehKroQqxxr+oQp5sBWbVxhCzMQf8zNAZB1BaRoHs/deRpUiyZMh1U
 /GAQl1L6D4gM3PrECd6kxDFhFegfqZZ0tsNh+lY4zlhyXDjAeIyR12RxM0InS5QALY+O
 msMA==
X-Gm-Message-State: ANoB5plbXHSDZ8RsR5XwmbSQK3TBNBtTnEqT8UcjhN8AmmA7imYj+/9v
 B+uGEIW0efJtH+4AyOMl9PMZAz47E2azmw3Flom4
X-Google-Smtp-Source: AA0mqf456SOTI8h5405bjuHYKyboskc6RX/a1Ar+YL3tEroIPWZYM0tvvsDsxRnA/dxrNyn4bb9+vxyTCfLgcpe9goM=
X-Received: by 2002:a63:64c5:0:b0:479:2109:506 with SMTP id
 y188-20020a6364c5000000b0047921090506mr1494989pgb.92.1671210325149; Fri, 16
 Dec 2022 09:05:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670606054.git.rgb@redhat.com>
 <45da8423b9b1e8fc7abd68cd2269acff8cf9022a.1670606054.git.rgb@redhat.com>
 <20221216164342.ojcbdifdmafq5njw@quack3>
In-Reply-To: <20221216164342.ojcbdifdmafq5njw@quack3>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 16 Dec 2022 12:05:14 -0500
Message-ID: <CAHC9VhQCQJ6_0RtHQHuA2FDje-3ick3b3ar8K8NAnuMF=ww2cA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] fanotify: define struct members to hold response
 decision context
To: Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 16, 2022 at 11:43 AM Jan Kara <jack@suse.cz> wrote:
>
> On Mon 12-12-22 09:06:10, Richard Guy Briggs wrote:
> > This patch adds a flag, FAN_INFO and an extensible buffer to provide
> > additional information about response decisions.  The buffer contains
> > one or more headers defining the information type and the length of the
> > following information.  The patch defines one additional information
> > type, FAN_RESPONSE_INFO_AUDIT_RULE, to audit a rule number.  This will
> > allow for the creation of other information types in the future if other
> > users of the API identify different needs.
> >
> > Suggested-by: Steve Grubb <sgrubb@redhat.com>
> > Link: https://lore.kernel.org/r/2745105.e9J7NaK4W3@x2
> > Suggested-by: Jan Kara <jack@suse.cz>
> > Link: https://lore.kernel.org/r/20201001101219.GE17860@quack2.suse.cz
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> Thanks for the patches. They look very good to me. Just two nits below. I
> can do the small updates on commit if there would be no other changes. But
> I'd like to get some review from audit guys for patch 3/3 before I commit
> this.

It's in my review queue, but it's a bit lower in the pile as my
understanding is that the linux-next folks don't like to see new
things in the next branches until after the merge window closes.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

