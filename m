Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F96F17CE
	for <lists+linux-audit@lfdr.de>; Fri, 28 Apr 2023 14:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682684734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rnai021oKrUFRmFdtt+kbONs+SkCu1K+vUCZjgwClB4=;
	b=hQcc7upQeiBFDm0yi/psgcxT079BODMFCCjkpF6MfBZlhd/JhsSRgHvtPLE/kxnfVB8PKG
	nIYKVILscFw2CS+GqFaf5mDVgoZE/wv+i7VOVkwcmpL/3OAfC9h5eEiHhD50m4nnR8b20T
	w1i6Cpm7YnWgaKaprLtBaLyjrkept3s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-4iWcBRZePSqRb44eAM5fQw-1; Fri, 28 Apr 2023 08:25:32 -0400
X-MC-Unique: 4iWcBRZePSqRb44eAM5fQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3BD929AA389;
	Fri, 28 Apr 2023 12:25:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5E3B1121314;
	Fri, 28 Apr 2023 12:25:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0F8111946A5A;
	Fri, 28 Apr 2023 12:25:22 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF8AC1946A49 for <linux-audit@listman.corp.redhat.com>;
 Fri, 28 Apr 2023 07:59:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 973F240C84A2; Fri, 28 Apr 2023 07:59:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69E8B40C2024
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 07:59:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC266113DFCD
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 07:54:49 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-vTRDdE6xN-6jhVqzUWm46A-1; Fri, 28 Apr 2023 03:54:47 -0400
X-MC-Unique: vTRDdE6xN-6jhVqzUWm46A-1
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-4f0108a7d20so1562704e87.3
 for <linux-audit@redhat.com>; Fri, 28 Apr 2023 00:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668485; x=1685260485;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mgBYRkk2aFFUF1O6JAybZvEUy5PB5UfVfaH91NHDAJA=;
 b=Zs4cv02WlVSaCTiH96ngSOLFxHbsAztxIDdTgv/H3e2/13NSKkyY1AWQ7mT+l6fANy
 o2Aitaaq/JglOB2y5uRVYDbHLe2Q/GBRozA1TOGSzAsdR3S031yaoQoUcy0Z6XQkSF7O
 SoI9BdbG6mj2yzz66D1ImSG7WjphDYik/Bs91cblOJZoBxkeyUhJJEZPVtAEl51kS8sg
 1amNW4orxIqX/M7qpwNsljMVIq7Y99hBJlQZslMJdTRA9XzOOJ1+y38vhHqPKx1fn3+F
 U6U82a0C7KrFpEsv8t7UG7a7WxjMinB7zohc0yet+fCHtqSTpBRg7gEaJ1NdXE2zn1ln
 XLmA==
X-Gm-Message-State: AC+VfDyrxDBTYboUZD8advHh2304ElYa9pEyk1jPZf2lTiFCqctmL1WI
 MkBTu18eYOiWcY1r3SnD4EEv1tGqZpmz77hPbBVloGTIBv5NNw==
X-Google-Smtp-Source: ACHHUZ7NySwNPoBYPSJ6W6OILfdQ8n3Dq6EPAZAiL4jeMlkaeswp4KVJ5b3uapl+yj/CoSo4U5JIy3RkFkTkpy9lUcg=
X-Received: by 2002:ac2:5290:0:b0:4ec:e32f:3d28 with SMTP id
 q16-20020ac25290000000b004ece32f3d28mr1159589lfm.32.1682668485498; Fri, 28
 Apr 2023 00:54:45 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5rGf5p2o?= <jiangyang.me@gmail.com>
Date: Fri, 28 Apr 2023 15:54:32 +0800
Message-ID: <CABvEhECpywJRHDW6dFZU8Q3_rCZ0MpG45UQVu8fgH7ENSK37dA@mail.gmail.com>
Subject: Re: Re: "service auditd start" fails inside a container
To: linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Fri, 28 Apr 2023 12:25:21 +0000
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============0362931216110536432=="

--===============0362931216110536432==
Content-Type: multipart/alternative; boundary="0000000000005a5b3905fa60c902"

--0000000000005a5b3905fa60c902
Content-Type: text/plain; charset="UTF-8"

May I ask if Auditd supports Docker? Thank you
https://listman.redhat.com/archives/linux-audit/2018-July/msg00078.html

--0000000000005a5b3905fa60c902
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>May I ask if Auditd supports Docker? Thank you<br></div><a href="https://listman.redhat.com/archives/linux-audit/2018-July/msg00078.html">https://listman.redhat.com/archives/linux-audit/2018-July/msg00078.html</a><br></div>

--0000000000005a5b3905fa60c902--

--===============0362931216110536432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0362931216110536432==--

