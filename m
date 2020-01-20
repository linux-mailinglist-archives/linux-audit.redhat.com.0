Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 380CF142E64
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 16:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579532943;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IuR1K+gqcf7+UydqaqUtDW2Ba4KWaSUbI6qD3j/ddA4=;
	b=CHGPqdnUo6LDvRKndvQ7Vk/+ac72rHpZfV0viblRSRDnR5yZxpfF1YP09IroeirraEwDEY
	z1O8IMJj66ZQU1wUq3jhvI33j6iyP+7j2GNVr+QRYrH+nNxne7ceMot+i4mLu1N8cLQH5P
	S/vKoVDmDIyXt8qOPkcP8l69vz0WzVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-08qCllOvPvquMrqH-4pXiQ-1; Mon, 20 Jan 2020 10:09:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F7DD1083E87;
	Mon, 20 Jan 2020 15:08:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A870D27BDA;
	Mon, 20 Jan 2020 15:08:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9162B1803C33;
	Mon, 20 Jan 2020 15:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KF4V6f019338 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:04:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0AFA410F8E10; Mon, 20 Jan 2020 15:04:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 059B610F8E11
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:04:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76F98800FEA
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:04:28 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
	[209.85.222.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-XZcbGejWN4ujVfWrPvljcw-1; Mon, 20 Jan 2020 10:04:26 -0500
Received: by mail-ua1-f44.google.com with SMTP id y3so11588878uae.3
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 07:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dvgugEmt3/rVXTTmgQqAGGMjfXiQ5LaBf4I8s+tixNU=;
	b=CCCiA+iTn5eh3qt19mqSKtM9073znjYfnx0o4tODVMb5OjJpOXUegsDxKqmqhCnS8w
	cFGN3oiwjRH1tYeJ1mImP8njg7tjukuKjk6Ur3FNn9Mp13ulqGnVgb+SDM05mhjG8mhL
	qg/p6FbII1pHA38ySKU/6/+kSi+Bm/ENQOSGEySL8ZvxI38Jz+F03DYsmWy0jxCC+Ilg
	BlTQW9hBZE93f1M+l5APy+ykuP1WfKJO9YLKoSfDB6bU6U6GUREgZ3qEv589NAuwJUrq
	TKVgbT/WkQ5RPRTbqux3EWexRVi71YUceNwXWgNOxXqj+eTBDpmB24uz+lGaSZiiTLr2
	AN1g==
X-Gm-Message-State: APjAAAVLptSy8qouALQhnX5MLeMDBI3OxrxDB4CVOzwVd7HMjCbJo+wF
	ep755g2dLq4k429T9MzH5aPE2o+j9Gc=
X-Google-Smtp-Source: APXvYqx4LGKm/UuGYLGHaDO2n2yqP3mrqQSX1HNz+atRepwHIOC+gBka++jnbVOHZVCJndSQRH9uqQ==
X-Received: by 2002:a9f:21aa:: with SMTP id 39mr106829uac.138.1579532665828;
	Mon, 20 Jan 2020 07:04:25 -0800 (PST)
Received: from [192.168.1.55] (c-73-217-142-143.hsd1.sc.comcast.net.
	[73.217.142.143]) by smtp.gmail.com with ESMTPSA id
	i66sm9799894vkh.28.2020.01.20.07.04.25 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 07:04:25 -0800 (PST)
Subject: Re: Duplicate settings?
To: linux-audit@redhat.com
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<7256033.AoGtHsJfsT@x2>
From: Leam Hall <leamhall@gmail.com>
Message-ID: <faddae2c-ba8b-2061-55b0-9f3eaab93c87@gmail.com>
Date: Mon, 20 Jan 2020 10:04:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7256033.AoGtHsJfsT@x2>
Content-Language: en-US
X-MC-Unique: XZcbGejWN4ujVfWrPvljcw-1
X-MC-Unique: 08qCllOvPvquMrqH-4pXiQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 20 Jan 2020 10:08:48 -0500
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 1/20/20 9:37 AM, Steve Grubb wrote:
> On Monday, January 20, 2020 9:24:56 AM EST Leam Hall wrote:
>> If /etc/audit/auditd.conf encounters conflicting duplicate settings,
>> what happens? Takes the first, takes the last, or what? For example:
>>
>> 	space_left = 25
>> 	space_left = 100
> 
> It overwrites the first value with the second one. You can also run:
> 
> # service auditd state
> 
> to see what the current value is if your audit daemon is somewhat recent.
> 
> -Steve

Hey Steve, a follow up. Is the man page for auditd.conf wrong? My auditd 
failed to start when giving space_left with a '%' sign.

  space_left
     This is a numeric value in megabytes that tells the audit daemon
     when  to  perform  a  configurable  action because the system is
     starting to run low on disk space. You may also append a percent
     sign  (e.g. 5%) to the number to have the audit daemon calculate
     the number based on the disk partition size.


Thanks!

Leam

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

