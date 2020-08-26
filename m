Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1E7252FE6
	for <lists+linux-audit@lfdr.de>; Wed, 26 Aug 2020 15:29:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-Y9rH4yKdO6ulyaB4meH1zg-1; Wed, 26 Aug 2020 09:29:54 -0400
X-MC-Unique: Y9rH4yKdO6ulyaB4meH1zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE13807332;
	Wed, 26 Aug 2020 13:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9A819C78;
	Wed, 26 Aug 2020 13:29:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B72DB18095FF;
	Wed, 26 Aug 2020 13:29:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QDTTRb028190 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 09:29:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8C949E67; Wed, 26 Aug 2020 13:29:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CE169E63
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 13:29:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FF69101A540
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 13:29:26 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-cCd3IeItOZSsZGUVyYwMow-1; Wed, 26 Aug 2020 09:29:23 -0400
X-MC-Unique: cCd3IeItOZSsZGUVyYwMow-1
Received: by mail-ed1-f65.google.com with SMTP id b2so1738379edw.5
	for <linux-audit@redhat.com>; Wed, 26 Aug 2020 06:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FkhfN3cT3cQJ7PHsuf80oD0j4Kw1XGx7zDFLh/m4hhg=;
	b=Xeyhpa2aWKgBoBWFHBj8VFgcp/RN2uaKk+4p3cr/ezGGkNeXystJ2PLlPEbeEbDNIf
	WuAUcUaMFR0NDk6xlGMmCdxfyVmXJRNoA5Idx4njnFzBHqwbS9KJADBlFs9lGwxU7JqH
	mwnn/O5ZpHqyIc7AwNj++6aE8NADKM+NAdhnMH+mh7vusRr4fJRMh1Hmj80KXasVPxP+
	P3TQxat1Qk4LssTTPvlbyq5CulH337yksppp4iwldulHFaIIWU18bBU7nlh/T7qP72Ys
	JXAyYYDnJweckYcwBZudARnwxhbL9T70MD0FIpbQDxYe1fkhk7qm2adkL7gbKCXDEUho
	9i1g==
X-Gm-Message-State: AOAM5323o3Go2Cs7EIrOkBi+A/U4rY85ZtpPKQgz4Bg39CTqB1Fm4vbF
	d16aJAy3CTLg8YV3pVzTJ7/o00TZnW0Ab4gj6IIG
X-Google-Smtp-Source: ABdhPJy/N1m1QzN8hzuSoLW6wNSlJZrPDSeobXqXnAmnCcPwNhVqQBagGacLHid3njrXbdkAgFSZbO3tzWrJYWtoQyY=
X-Received: by 2002:aa7:ca46:: with SMTP id j6mr12617276edt.128.1598448562248; 
	Wed, 26 Aug 2020 06:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200826040022.5297-1-vulab@iscas.ac.cn>
In-Reply-To: <20200826040022.5297-1-vulab@iscas.ac.cn>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Aug 2020 09:29:11 -0400
Message-ID: <CAHC9VhSt83DCf7hwavCJvgTSSVy7xgvumjx-hAk+cG1faig_XA@mail.gmail.com>
Subject: Re: [PATCH] audit: Remove redundant null check
To: Xu Wang <vulab@iscas.ac.cn>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 12:00 AM Xu Wang <vulab@iscas.ac.cn> wrote:
>
> Because kfree_skb already checked NULL skb parameter,
> so the additional check is unnecessary, just remove it.
>
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  kernel/audit.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged into audit/next, thanks.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

