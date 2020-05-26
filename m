Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 89C1E1E21ED
	for <lists+linux-audit@lfdr.de>; Tue, 26 May 2020 14:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590496372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=stRRX+bB0Qwsw9CTllDWL+bTU1pZ4DiDO4bWlmEoEpA=;
	b=GLwk2wr7zpKpGLUUEbjw8HiH+1FLRC+GIPF+Rf+SimjsRYCV3GTZCd7GCejXWyiJNHQK9P
	HOzHC2U6h3cki2v882/ATLwvF9yK7olVWXe1YXW6p1ZuJi7z95gB2yYQKE9b3epIrbLspD
	IlhnzF3BoCdZuPmhTYbKmn5qW9jBJR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-gEomF06rPhKdueHeQnOK2g-1; Tue, 26 May 2020 08:32:50 -0400
X-MC-Unique: gEomF06rPhKdueHeQnOK2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC19464;
	Tue, 26 May 2020 12:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5B927C081;
	Tue, 26 May 2020 12:32:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9384C1809543;
	Tue, 26 May 2020 12:32:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QCWOJ3008181 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 08:32:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C32410F8E22; Tue, 26 May 2020 12:32:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F12610031E5
	for <linux-audit@redhat.com>; Tue, 26 May 2020 12:32:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A0018A6663
	for <linux-audit@redhat.com>; Tue, 26 May 2020 12:32:22 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-495-M5FlR7QFO8ae-ws5lx9hjg-1; Tue, 26 May 2020 08:32:19 -0400
X-MC-Unique: M5FlR7QFO8ae-ws5lx9hjg-1
Received: by mail-ej1-f44.google.com with SMTP id se13so23575473ejb.9
	for <linux-audit@redhat.com>; Tue, 26 May 2020 05:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6QfVNKnipID706T3CClLVmwjg8Bm4Hkb3Sxmh8ER+w=;
	b=GMsHAxJVW50FTdbhts7reZf6odh80eZkDaP2yvDMFsRxDq4ACHcT4pnjGPuycMoOyT
	rjgkF07lpkg7kt10+xqhJeMCcITHC+Ff1rTi+BvGwpTD+qSu0FQFtsNchNu5Bl9NVCsj
	QuMtAedIiOeqImldvwbi7lvkUHplVd2DB5dSIUGb6jxKzG/yq5OoKpQ3u1v2Zm2Tb/P3
	RGloDszsmU9PRBPkomS0SEcZ8KEpnunc/hplj21SVQPDy0ByV53dVxsmtZf4/piaogZ5
	5lAVBT4Ai9146nlhXCV2J8qU/3o8kLR8u/EbqRq7nU4c+DvencQrJFmocvUN1zOGgZKn
	aXwg==
X-Gm-Message-State: AOAM531m8omAKaGmCkIWgKgBK8/c1zMUoOdPmpCDrPW4RAxJ3RZfdSCq
	gzRfS8cz67phwBuFxrRJbSIqcx1fR2A2DE+g2wzCSSw=
X-Google-Smtp-Source: ABdhPJzpau3Q+RGBgLn+um6muFx7+ct7lSNzjqZxQRK5uKV/K2SGaEvAzIo7EoYdVb64hlnpG1/BeF8iRRA1MTYdgQs=
X-Received: by 2002:a17:906:7e15:: with SMTP id
	e21mr905052ejr.106.1590496337575; 
	Tue, 26 May 2020 05:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
In-Reply-To: <1590391317-71528-1-git-send-email-guyiwen@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 May 2020 08:32:06 -0400
Message-ID: <CAHC9VhQ8orX0B4Rq5ztaumrGQKmaPvu8n059MomRM0fxUc3H_Q@mail.gmail.com>
Subject: Re: [RFC] audit: allow audit_reusename to check kernel path
To: Yiwen Gu <guyiwen@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 25, 2020 at 3:22 AM Yiwen Gu <guyiwen@huawei.com> wrote:
> For now, we met a situation where the audit_reusename checking
> function returns the same filename structure for files sharing
> the same uptr. However, these files are different, and we are trying
> to open them in a loop where the names are loaded into the same address.
> Therefore, the function returns the same structure for different files.
> By the way, may I ask in what situation would the audit_list be kept
> across syscalls?

What kernel are you using?  Is this an Android kernel?

Do you have a reproducer you can share?

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

