Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 21E141D52C9
	for <lists+linux-audit@lfdr.de>; Fri, 15 May 2020 17:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589554863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NcLQQVP5GRfZA1SbcuqhKRRAWiZLBw0XU4Nvn04oQ1g=;
	b=g5Gyv6bdfZ4ctqFekFGPYZO+JL6O61oVy7JP+FHqZUDXRqTZs4QPC/AxbeCRXuNdD+8zb+
	FP//MjVi6kPJCMCuVDBvxv/luO2znnM35VmnKntPN+DqolX3PgBnPX+MXOs7UG/ZGZf3Tp
	FpSBSnwbSlf7kLRLs3EIpwy4BH6HZm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Cj46xJV6NVydnPd9fIp1kw-1; Fri, 15 May 2020 11:01:01 -0400
X-MC-Unique: Cj46xJV6NVydnPd9fIp1kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 518FE108BD0D;
	Fri, 15 May 2020 15:00:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78DCB46;
	Fri, 15 May 2020 15:00:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE4AB4E9E7;
	Fri, 15 May 2020 15:00:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FF0Rgw006828 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 11:00:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEACE2156A4E; Fri, 15 May 2020 15:00:26 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D45C32156A4C
	for <linux-audit@redhat.com>; Fri, 15 May 2020 15:00:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA540108C1CE
	for <linux-audit@redhat.com>; Fri, 15 May 2020 15:00:24 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-514-ML_vGEm_M3y_hjqYm76RVg-1; Fri, 15 May 2020 11:00:22 -0400
X-MC-Unique: ML_vGEm_M3y_hjqYm76RVg-1
Received: by mail-pj1-f43.google.com with SMTP id n15so1019956pjt.4
	for <linux-audit@redhat.com>; Fri, 15 May 2020 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+50nM/tSM49wAiLAZ+cu2/rRsZuzUwwikckDARUl/To=;
	b=E5OU1cLSmTLlXdWIkNQByJ5ZHR6f+RCwe55bmClQ9ijtpe9EU1WE3Jz2J9KySJkqYi
	bAy5FYOETA6GNtoylj0cYmIUlMVi4tbsL+a7Sv1l6A7W9jOaU2owXikL7j6xTGV7BtZ2
	U0RMz8u27j8b7e56B6IwPH6LYKkrDe+s2qh//ywCh6IWJocyJ7GAiShclmIZoFgXFwJm
	M2tYwNFEXap7lZTbxPQDdLzZfuZvQFBu7rwqIuxG83aJFebmN7Ql/Y2m7TAcEXpT0N4c
	+kk3eKUhBfziMSNixx183+eR5gFZHDV6I9mNxli1l1flpDEa2Ji7KdWpWe86vfntHjqA
	bpJg==
X-Gm-Message-State: AOAM531TuLAHekxvpsUsoOq8YRcf1M5l1gipcP/oJxgu9dxuLcqxeJaa
	YM/3X8lX763BbFrmXcOw04l135UuMeM=
X-Google-Smtp-Source: ABdhPJwTMlX3QsL9z9/hpIoQdJZtmdSOL0vZU3fnLHMg5BfEs3NH9J5q2b10Sz2taShUDipQdZhG3Q==
X-Received: by 2002:a17:902:778a:: with SMTP id
	o10mr3918290pll.76.1589554820321; 
	Fri, 15 May 2020 08:00:20 -0700 (PDT)
Received: from ?IPv6:2607:f768:200:b:ffff:ffff:ffff:fe24?
	([2607:f768:200:b:ffff:ffff:ffff:fe24])
	by smtp.gmail.com with ESMTPSA id
	b15sm1929237pgh.47.2020.05.15.08.00.18 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 15 May 2020 08:00:19 -0700 (PDT)
Subject: Re: reactive audit proposal
To: linux-audit@redhat.com
References: <6360160.ZmnOHIC0Qm@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <7605c8b3-92ac-992a-7539-f5374d3e69c7@magitekltd.com>
Date: Fri, 15 May 2020 09:00:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6360160.ZmnOHIC0Qm@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
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

On 5/12/20 6:22 PM, Steve Grubb wrote:

> It may also be possible to poll /sys/block to watch for changes. This might
> be easier as the names are more friendly. This would take some research to
> see if its even possible.
>
> The rule syntax could look something like:
> on=mount mount=/run/user/1000 : -a exit,always ...
> on=device device=/dev/sdd : -a exit,always ...
>
> The on-login event would simply watch the audit trail for any AUDIT_LOGIN
> events. That event can be parsed to get the new auid. If the auid matches
> any rules, then it will load them into the kernel. To remove the rules, we
> could watch for the AUDIT_USER_END event. The only issue is that we would
> need to track how many sessions the user has open and remove the rules only
> when the last session closes out.
>
> The rules for this might look something like this:
> on=login auid=1000 : -a exit,always ...
>
> The question is whether or not this should be done as part of the audit
> daemon or as a plugin for the audit daemon. One advantage of doing this as
> a plugin is that it will keep the audit daemon focused on getting events
> and distributing them. Any programming mistake in the plugin will crash it
> and not the daemon. The tradeoff is that it will get the event slightly
> after auditd sees it. This only matters for the on-login functionality. The
> device and mount events come from an entirely different source. And I'm sure
> that in every case, the program will react faster than a user possibily can
> winning the race evry time.


Although I like this generally, I also have to say that I'm generally 
apprehensive (OK scared) of dynamic rules.

I think also that while your proposal makes sense for some (likely many) 
use cases, usually not ones I deal with. Controlled spaces don't allow 
USB drives and even so, we detect this adequately now. Have plans of 
using USBGuard to augment that stance.

So in that regard, a plugin would be far better for me so I can disable 
it until it fits the model under which I operate. Just my own small, 
non-standard myopic focus. :-)

I also believe that this has more generic application, and you are 
probably using the USB device as an exemplar. There may be other 
reactive rule use cases I would be inclined to reassess.

The login/user_end event watching does pique my interest...besides 
device insertion I imagine there would be some interesting things you 
could do on the fly with that.

But again for me the strength of locking the rules into place is pretty 
big. I can only imagine what an informed pen test crew would do with 
dynamic rule manipulation.

Thanks Steve!

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

