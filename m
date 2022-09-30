Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE35F118F
	for <lists+linux-audit@lfdr.de>; Fri, 30 Sep 2022 20:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664562215;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TykGQx9VBaGBra5Mn5rwSkINAiUMEj5qEjz1un2D3Fo=;
	b=OGSP0MqtZyi8aWcPY47BMkky6YFoNDxydZKV6iZVhDI/yLrQKPiFPeJrYRzSyyzX0UFdnm
	MxuCmCGpoDrbL/t7cDivy3bRl5vv7C+E32W3Di5EJzfUIMOY/HqxE4KvXKRTvvwnbsSED9
	P627kKs/3Wupq6MA1KFIKCj5DfB09CM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-b-Igw_4uNWWbXgNn-VokVA-1; Fri, 30 Sep 2022 14:23:28 -0400
X-MC-Unique: b-Igw_4uNWWbXgNn-VokVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A141800B30;
	Fri, 30 Sep 2022 18:23:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9A682166B26;
	Fri, 30 Sep 2022 18:23:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4ED381946A6D;
	Fri, 30 Sep 2022 18:23:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0845B1946A52 for <linux-audit@listman.corp.redhat.com>;
 Fri, 30 Sep 2022 18:23:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CDC0C492CA2; Fri, 30 Sep 2022 18:23:07 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6715492CA5
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 18:23:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC3C38828C0
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 18:23:07 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-R-zgaMbcP_qy0t__HyuTBA-1; Fri, 30 Sep 2022 14:23:05 -0400
X-MC-Unique: R-zgaMbcP_qy0t__HyuTBA-1
Received: by mail-oi1-f182.google.com with SMTP id n83so5543239oif.11
 for <linux-audit@redhat.com>; Fri, 30 Sep 2022 11:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=C5CghR29yj45o3eN9hrrm+lM05BpwaaPuSm3KGiUITo=;
 b=7Pm9LFYbu5ejpa55LLP1MASUYzb3cKIfzzTO8tH7i4e00EVB7upjjTbCXuCeM6xYmC
 sCWExcVPONKmMkMuBkbEKyR4P0Tlt6PIgmorTgUhxXwXLK13qcFI0PvHqhMBnDAQfJxP
 QN3OLjnQ+ZyUXhhcBsXBImFb8fs7v49ZZ6HJg8eoacjWVNr3UR0PmMQCr/9/fEXK3iNJ
 1gZOhF23U54Zz7vCdz8wTRt1CZMnlRtE3cdU6myRAal+CSo51I3aYBlVPpvSWNKUMTAB
 9S69TmpeP1b+EqmFH+At6Bnb9fsH9awcOjV2NMSkmmQf3xLmyjIXT0e6nwoHwE3kAZFP
 imoA==
X-Gm-Message-State: ACrzQf3Bon/7xTs7VFfGul9w4kvDx3RGyuAp8ZKm6Ws6TgBsDqY+L19L
 ouW69KIso/iW2/lUTNbQ98Bs9nSVDNjrY5fNuXzv
X-Google-Smtp-Source: AMsMyM5IepoYWFnSCH4BjrDLynXvGCto0GdO0Q4mqJt53q4dk6TJuFaPuzZ6jxIe2SxOqHZtzxg71FpVPLbADzteVf0=
X-Received: by 2002:aca:1c13:0:b0:350:ce21:a022 with SMTP id
 c19-20020aca1c13000000b00350ce21a022mr4493024oic.172.1664562184553; Fri, 30
 Sep 2022 11:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220927225944.2254360-1-ankur.a.arora@oracle.com>
 <20220927225944.2254360-2-ankur.a.arora@oracle.com> <8171459.NyiUUSuA9g@x2>
In-Reply-To: <8171459.NyiUUSuA9g@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 Sep 2022 14:22:53 -0400
Message-ID: <CAHC9VhR2AL9o6SKXW9xNJo5PW6T0CdTxbh8sy5OgE0ifY29RAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] audit: cache ctx->major in audit_filter_syscall()
To: Ankur Arora <ankur.a.arora@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, eparis@redhat.com,
 linux-audit@redhat.com, boris.ostrovsky@oracle.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 30, 2022 at 1:45 PM Steve Grubb <sgrubb@redhat.com> wrote:
> Hello,
>
> Thanks for the detailed notes on this investigation. It really is  a lot of
> good information backing this up. However, there will come a day when someone
> sees this "major = ctx->major" and they will send a patch to "fix" this
> unnecessary assignment. If you are sending a V2 of this set, I would suggest
> adding some comment in the code that this is for a performance improvement
> and to see the commit message for additional info.

Please do not send a v2 with the changes Steve is suggesting, I think
this patch is fine as-is.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

