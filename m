Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7601CA110
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 04:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588906139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cyll7IEVpGRZtSkTZSXoQcigFhcSoREyi6mDAZdV5rE=;
	b=dkKq+0HrHPSliT2hbMzI/NsYrE3dki/4ZQkfzHcjRh+QJG/+Yip+p3MEG8KRXfmx5RibEB
	BpRKk4JN7ptHKkitmMfILNMVJDPaRolXvcd3vfqxLJ1x3v/pkviBe8ugr2Nb1qgkp1CTXf
	GvnaJlhSREsiriarLMYnGYqmNDNd1p4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-OYyFNcRJOPqhvPfC6lY8qA-1; Thu, 07 May 2020 22:48:56 -0400
X-MC-Unique: OYyFNcRJOPqhvPfC6lY8qA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A764107ACF2;
	Fri,  8 May 2020 02:48:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 644945D9CA;
	Fri,  8 May 2020 02:48:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A5DA1809543;
	Fri,  8 May 2020 02:48:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0482mgEQ012933 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 22:48:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E81B11D292; Fri,  8 May 2020 02:48:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB1E53C2
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:48:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD69E8007DB
	for <linux-audit@redhat.com>; Fri,  8 May 2020 02:48:39 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-6__-HKYzO6-XC5Tx8KTRWA-1; Thu, 07 May 2020 22:48:35 -0400
X-MC-Unique: 6__-HKYzO6-XC5Tx8KTRWA-1
Received: by mail-ed1-f67.google.com with SMTP id p16so55755edm.10
	for <linux-audit@redhat.com>; Thu, 07 May 2020 19:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KLZQYSIf7qfSBLr/gKPt/c8GOu7kRmWTRuEn699IMDw=;
	b=ujiKJBjVFrN93lnmBgkl2Tal5GQQAUe0DaxSm0Ov2j0qqCD5tZboFKSGTI5Hipr+Rj
	CajBkVUXqxqs1PlY5TfRE/nT/skWszZXhNPhd4zYMVtSGAGmfsP/TS5xttJOZolbt4Xf
	7soTs7/oLt5CpoSI6QnPD+pBudLRwpQI/Y4wzEYfKrdKzM5a9T1P0kl5TR4DlKhCdf7Y
	fxY6AOozxNJT6XZmpg3mIe0WXcGvczJkaWS/ajjIoMs530Zmg/ehFvBh41Ws44GRu9qo
	vRYY8g3VNBohWarc8MTHt872rUhWGZjiyNsC2NSTlJ1cXgCIHiOjnA7o2hUeYIbff8lJ
	mnKw==
X-Gm-Message-State: AGi0PuZ+sxHOHdzIgJHx/Ml5ug2fFSXWkqIcx6mUiWIVvrKMMrvk+PzV
	w9YRcKckkEj6cpjY9AUS2vbT8dC1ZJjlrYRuJMfw
X-Google-Smtp-Source: APiQypJ1JZ7IFS3WkxAtuyvG5xE2Yb54OZW8v3tJolFg9OvRJ2M+B/WgLPc4kqcL1KyoJ4XRFiO5YFsRLmz9Y8fXwBg=
X-Received: by 2002:a50:d98b:: with SMTP id w11mr353204edj.196.1588906113921; 
	Thu, 07 May 2020 19:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200507185041.GA13930@embeddedor>
	<20200507215812.ksvwcykfged7ye2a@madcap2.tricolour.ca>
	<20200507224955.GA22343@embeddedor>
In-Reply-To: <20200507224955.GA22343@embeddedor>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 7 May 2020 22:48:22 -0400
Message-ID: <CAHC9VhQawsT6Z7U7o53XpBbX2Azu4rMMojGgfCJYhppBcsvZKA@mail.gmail.com>
Subject: Re: [PATCH] audit: Replace zero-length array with flexible-array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0482mgEQ012933
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 7, 2020 at 6:45 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> I wouldn't advise to make any of these conversions in include/uapi/ ...

Yes, let's not make changes like this to anything under include/uapi;
the potential reward doesn't outweigh the risks.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

