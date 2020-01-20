Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 83F4A142E65
	for <lists+linux-audit@lfdr.de>; Mon, 20 Jan 2020 16:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579532943;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0JBg5Oro5vnmX1OfX6JcLneVfxzlLRPoZyAO0fbEfzs=;
	b=M/x1sYmbzWX/JXyMefmOQYtDVDFyyPhEe097nxgYsG9S9mJIiK2XzHoQGym4K3Ur+7mNWE
	HxCBkrinLt5vYk8COPJzEcEZEGoPm0X6LNvNiU+oP89KALJniUlIpwFhENU73m1hWaX6C/
	iZ0V3TKnRVMv18SC3WnhFKYi/3ihG0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-qJkYb1rAP0qpi7kMKfo9rw-1; Mon, 20 Jan 2020 10:09:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F818C24A5;
	Mon, 20 Jan 2020 15:08:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C2C5D9C5;
	Mon, 20 Jan 2020 15:08:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90B2D81974;
	Mon, 20 Jan 2020 15:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KF0Dat019162 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:00:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E8FE32166B2A; Mon, 20 Jan 2020 15:00:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4B962166B29
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:00:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E51CD8012D0
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 15:00:10 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-17-epy5laAdN8KmKwWhW-0lqg-1; Mon, 20 Jan 2020 10:00:09 -0500
Received: by mail-vs1-f44.google.com with SMTP id n27so19098029vsa.0
	for <linux-audit@redhat.com>; Mon, 20 Jan 2020 07:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0E0b29A1Qgad69vA79aRxqu0uuyiE6OETpBYRFTLAjw=;
	b=ajAp9J1vx3xklg1GHS6xZyIYTuMos8sS9lnF8G0TysaKvuN29fAl6CUPqvLjJaTJ1F
	slIQRzi96Dwu2hdhRuxBUK2G1C+WbSmTf6w4hKVBORgtDO0xur2EjHC+JG5glrk92ebH
	YvVimmPEtghwGR5BmRVGVrElC1XBClo9HMTewrBX0ffsCThtRAJhjrGl+Qpq9TyHeMlY
	LOBOmzy0CIUHwo5YeSgBEARjki3DD3RBqNOW193PIVRlt3madeTn1KIsURCY80/y6Dbh
	FjxCQxm8ZpuAUyM9Mg35JtiCsC1C+S/2IjXWYAbcQMiXZAlOrRQehSHvrX48Ar2C+9GW
	CcSQ==
X-Gm-Message-State: APjAAAVFxIG9xa6l+Mh9GAFYBxMNxdgLUg0Er+1irWDmkeGSSA6T0Hob
	+nAelT6jXFWcbEID2jbEQOvLD6kpSTI=
X-Google-Smtp-Source: APXvYqxgKmKLmi9t2kbkuqxd4vrj/h0jYUU25dAMTL+uepVOIs2/vyeSqzZeWjstOallSPR0tk2HIA==
X-Received: by 2002:a05:6102:226a:: with SMTP id
	v10mr12396977vsd.158.1579532408093; 
	Mon, 20 Jan 2020 07:00:08 -0800 (PST)
Received: from [192.168.1.55] (c-73-217-142-143.hsd1.sc.comcast.net.
	[73.217.142.143])
	by smtp.gmail.com with ESMTPSA id i10sm8225997vsq.3.2020.01.20.07.00.06
	for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 07:00:07 -0800 (PST)
Subject: Re: Duplicate settings?
To: linux-audit@redhat.com
References: <725ed78a-f8e8-d73a-486a-13e821567752@gmail.com>
	<7256033.AoGtHsJfsT@x2>
From: Leam Hall <leamhall@gmail.com>
Message-ID: <f61d4614-cd98-5cad-e739-82ce82ab258b@gmail.com>
Date: Mon, 20 Jan 2020 10:00:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7256033.AoGtHsJfsT@x2>
Content-Language: en-US
X-MC-Unique: epy5laAdN8KmKwWhW-0lqg-1
X-MC-Unique: qJkYb1rAP0qpi7kMKfo9rw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Hey Steve, thanks! We're on the default RHEL/CentOS 7 auditd, and 
"state" doesn't show space_left.

Leam

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

