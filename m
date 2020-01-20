Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0DE142D91
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 15:30:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579530644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IxFgXwQ5vLZsDrrmcLhIlRky+J7M9KAifzFVkS+kcCg=;
	b=DnS22+Rg37H8HZoH3CXIEBM3dF45JfxS3b6QIvuY8NFFGJaluMfZ48QVzkFt/B4tJ9ahe/
	SMu6onFI4e2gbs//e7ZwHuZoIzDwHSd1StsRN/Tqhs3oRYuL5i6z2mW95YwzkeGKHV3Hvp
	vn+BxKwBwb9CRg76SMw4nGXztD6pn5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-mojSGHTNMJOM7me04pJEAA-1; Mon, 20 Jan 2020 09:30:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB45800D41;
	Mon, 20 Jan 2020 14:30:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E6C0860E0;
	Mon, 20 Jan 2020 14:30:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 370AF81974;
	Mon, 20 Jan 2020 14:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KEP3dL016867 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 09:25:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5B92610BE379; Mon, 20 Jan 2020 14:25:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A65410BE389
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 14:25:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B61B802846
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 14:25:01 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-FWgKp49_MNSj4e6BtSa0Kg-1; Mon, 20 Jan 2020 09:24:59 -0500
Received: by mail-vs1-f53.google.com with SMTP id x18so19021754vsq.4
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 06:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=9h5taT0iW66jIJFpXWARoxovdK/NK1idUOKzyXfH0Jc=;
	b=WaKPcmUuK37dzG/WsOCVbzM9pW5ks5S6SxAtWz0JOaDrkmP3vkW7qzJbVenCJlgQvf
	kNrtARnuQhA1xW1ER/hdKnPCzJ8mDGkBWzlcK6jtVs8nENyUlNE63SomNZ5YgVKI1lRy
	p7uikCEd/wYqqLuRM6AVnAr4vSFMniCnbEp2GD2fEY3fLh9bI38iNq3YpT2CooZIcNuq
	FhAkbwuuB96r3dvNV33aXtmoU8BA4c6cNEqWYUxKP/txr3c4TNBYvqbyU3B3Eg2MXRpm
	5VGkNXLR3Io41A4cAMxVkeY3SMwsX/P6M1ZyQF71PNBOsIQrzMRlqJQ9iNZ5cZVOxF2R
	UgAA==
X-Gm-Message-State: APjAAAXgAtpRtOG6QuvTTj4VWC8/WLKf3WCLXM2ikKiGUj+XQ88auWZ8
	1TwAl5bNazLwp/G0Ps3yQ5j95bUptyg=
X-Google-Smtp-Source: APXvYqwrCCeCIg2Kx07YFVaeBB/CgpylXzSSPYbn4ImOLpe5z0YXMUfkvqXy2yTweCWud/3vTOCeaQ==
X-Received: by 2002:a05:6102:d2:: with SMTP id
	u18mr13152484vsp.192.1579530298729; 
	Mon, 20 Jan 2020 06:24:58 -0800 (PST)
Received: from [192.168.1.55] (c-73-217-142-143.hsd1.sc.comcast.net.
	[73.217.142.143]) by smtp.gmail.com with ESMTPSA id
	d65sm9756186vke.39.2020.01.20.06.24.57 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 06:24:57 -0800 (PST)
To: linux-audit@redhat.com
From: Leam Hall <leamhall@gmail.com>
Subject: Duplicate settings?
Message-ID: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
Date: Mon, 20 Jan 2020 09:24:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: FWgKp49_MNSj4e6BtSa0Kg-1
X-MC-Unique: mojSGHTNMJOM7me04pJEAA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jan 2020 09:30:11 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

If /etc/audit/auditd.conf encounters conflicting duplicate settings, 
what happens? Takes the first, takes the last, or what? For example:

	space_left = 25
	space_left = 100

Thanks!

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

