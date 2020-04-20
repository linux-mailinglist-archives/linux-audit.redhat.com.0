Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7B21B1A32
	for <lists+linux-audit@lfdr.de>; Tue, 21 Apr 2020 01:36:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587425814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EfD0HJifgCukWh12ZiSjkPcs/EtC7jqDclt6eNSuSEA=;
	b=Z/kPRKODuI1SALwEltpdXR/MN294OkSuvBz3wONhvTPxLcCKuFkGDmwcL7yDpN7oA8IyqT
	WVpCkspJF/hPiIxBHsn1iUlGyZebN5EbhHEuduqEkoXOLLbogYN//xEgvWyfr82T4zNmlB
	ljRFD0hjAK+3nnAIVI4T1mmCQmN9TQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-L2GBGT9jM6u7xmlYcjFFEA-1; Mon, 20 Apr 2020 19:36:51 -0400
X-MC-Unique: L2GBGT9jM6u7xmlYcjFFEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18435107ACCA;
	Mon, 20 Apr 2020 23:36:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D851D9DD8A;
	Mon, 20 Apr 2020 23:36:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F554180880B;
	Mon, 20 Apr 2020 23:36:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KNaDqL004270 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 19:36:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1588910D14F3; Mon, 20 Apr 2020 23:36:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1188510D14E7
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:36:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D509C800296
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 23:36:10 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-hPy2cGM-OUqCSxVj8Qt25g-1; Mon, 20 Apr 2020 19:36:07 -0400
X-MC-Unique: hPy2cGM-OUqCSxVj8Qt25g-1
Received: by mail-ej1-f66.google.com with SMTP id k8so1062391ejv.3
	for <linux-audit@redhat.com>; Mon, 20 Apr 2020 16:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gdEsZ6t0ZzFTv+NHkUz46DWLUHu1oorcRV5Pw37T6Fw=;
	b=ZqSWU6Z/hVfeN1VNtTk6NScrCVLsVYUyXZ//k+IzJIkBega1C/4vUe5J1cTDuzYMWd
	4cToE0jxojqWoXiUz91XNYTpEZohiiOstePx+YvvSxWXIrkW9po5beX2TQOAid9+KThn
	Ls9LwHbirSi+sUCkPSpewZap7FalmWzbRU+N4vZd9lAb68ZmCu7OjWgivKZOU6HPPdOh
	X5SGHi/fa5h7Vr+riMjYVtyXkty7W4HG4bnBZJrr1PUcc+zuZr/pBr850QcSdg7FG+pf
	LTyWTgVifiOlowFT2Y6lkA0sNg/Etpt1yKiTbE5XlhRbhM/DdzarkThpT4aMdUfMyxIp
	fj7g==
X-Gm-Message-State: AGi0PuYNi3E48dY0daU1mBrp5Krwc34njSqEzIDyAoq0TGryCf544yEw
	AgAVh/l4H2+UTGRFTXOaV+OajqTiOcnXps9huMk9
X-Google-Smtp-Source: APiQypJNxp/AAwiCpkhKGsjm/jG11wv+7GKhWkt363M1bv5v/eP/E9D3opc6N684TTLeYiwEO8SnFVNtv0zkQbfgZoE=
X-Received: by 2002:a17:906:f106:: with SMTP id
	gv6mr19044013ejb.271.1587425766204; 
	Mon, 20 Apr 2020 16:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <158741309840.178400.7330307620088250679.stgit@chester>
	<20200420222715.hm3zhk3vadyvi5qq@madcap2.tricolour.ca>
In-Reply-To: <20200420222715.hm3zhk3vadyvi5qq@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 20 Apr 2020 19:35:55 -0400
Message-ID: <CAHC9VhS-jz7Uy6WGeZ-MxOGKVMYbM-M-TQBBCHj4zy9uOmN_5A@mail.gmail.com>
Subject: Re: [PATCH] audit: fix a net reference leak in audit_send_reply()
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KNaDqL004270
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, teroincn@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 20, 2020 at 6:27 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-20 16:04, Paul Moore wrote:
> > If audit_send_reply() fails when trying to create a new thread to
> > send the reply it also fails to cleanup properly, leaking a reference
> > to a net structure.  This patch fixes the error path and makes a
> > handful of other cleanups that came up while fixing the code.
>
> Looks good to me.
>
> > Reported-by: teroincn@gmail.com
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
>
> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

Thanks.  I just merged this into audit/next.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

