Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 72D771D03A1
	for <lists+linux-audit@lfdr.de>; Wed, 13 May 2020 02:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589329928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5N3j1iTd1Mp+iottAOUwtazXV8Qs5gtNljg+9O2q5YE=;
	b=L+T+oHJSD1+sLzNGiD0JAOwePsWzr9jn4xrAClp2902PIyrMlSX+RNBZBeJtn7ATcELzXr
	YWDwxJCtIPxh3vEXp/3ha46PKXvgw6PKDyGMqEr9z9qphnKxAZ7taZpY4qRuzdnkfzAGex
	/a6iD+ZUKEiYvq7IEK7OqoTKO1oStLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-bUOFLq_9Pf2wuryEEW_fvA-1; Tue, 12 May 2020 20:32:06 -0400
X-MC-Unique: bUOFLq_9Pf2wuryEEW_fvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4D8189952C;
	Wed, 13 May 2020 00:32:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0420D60C87;
	Wed, 13 May 2020 00:31:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1873318095FF;
	Wed, 13 May 2020 00:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D0VrDj002314 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 20:31:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E59C4100402D; Wed, 13 May 2020 00:31:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E15DF1004029
	for <linux-audit@redhat.com>; Wed, 13 May 2020 00:31:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BE6E85A5B0
	for <linux-audit@redhat.com>; Wed, 13 May 2020 00:31:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-208-aAcp7rBOMx6VpqplskNKIQ-1; Tue, 12 May 2020 20:31:47 -0400
X-MC-Unique: aAcp7rBOMx6VpqplskNKIQ-1
Received: by mail-qv1-f45.google.com with SMTP id ep1so7435860qvb.0;
	Tue, 12 May 2020 17:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:mime-version:subject:from:in-reply-to
	:date:cc:content-transfer-encoding:message-id:references:to;
	bh=PHEnMu9OSQE0xRB1v0OkMpZllL3CMYO1MMI3aurOkkg=;
	b=qFLQFi+6FrcwaIKnAXFoJycXLTZGY82Tq2AwY3HBYJAQQJm7iLK5r0yTjLmL2iv6c9
	cXXx5E8wlVn4/i/jqXYYzXwGicxNMsJP1vM9j3h26vWTxvpnaiigdXDSQFGPVm9XTsb2
	+69a+OcBzHchlbLe+6taglZTBs9HUjn5VMeZuOcEkBU3yvIXs36uoGsfoNgdWD3GnPtI
	uY0kMaLsGOYgtEDLvGjWjtelE5MYZHC1oXMNcmj//SuQroi4W/PQd6AIPk0rmtIX8ng5
	kDtERfsJxutqTye5+HBKxByvvq4uR89i2W9OAvL6CQjeIQRwe/UKBWb6kYkMYGTfaIyu
	zadw==
X-Gm-Message-State: AOAM531EPqi89pReJBx/TIvnF8a9cCSxq/2FoIROI9Rf62F2pORS8AjB
	xNysGORPRqgkcrEcr+bwGF4odF32Npw=
X-Google-Smtp-Source: ABdhPJyacwCoEgemVsemYejmxMlzc2SSV3J52SvwOxeS+5++auG5tvk+jFhEPs4tIInGLIPcaj+dHw==
X-Received: by 2002:a0c:eacb:: with SMTP id y11mr9156209qvp.141.1589329907037; 
	Tue, 12 May 2020 17:31:47 -0700 (PDT)
Received: from [192.168.20.239] ([136.49.78.73])
	by smtp.gmail.com with ESMTPSA id
	u43sm6008241qtc.78.2020.05.12.17.31.46
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2020 17:31:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: reactive audit proposal
From: Joe Nall <joe@nall.com>
In-Reply-To: <6360160.ZmnOHIC0Qm@x2>
Date: Tue, 12 May 2020 19:31:45 -0500
Message-Id: <DBCA4F02-8F41-4585-89B7-EB2E2AE481D6@nall.com>
References: <6360160.ZmnOHIC0Qm@x2>
To: Steve Grubb <sgrubb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04D0VrDj002314
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On May 12, 2020, at 7:22 PM, Steve Grubb <sgrubb@redhat.com> wrote:
> 
> Hello,
> 
> I wanted to run this by the crowd to see what people's reaction might be.
> 
> The audit system sometimes needs to have rules applied when something
> happens. For example, if someone plugs in a USB flash drive, the system
> creates the device in /dev and then automatically mounts it under some
> circumstances.
> 
> I would propose 2 new additions to the audit rule syntax: on-mount and
> on-login.These rules would be in a separate file from the main audit rules.
> When a file system is mounted, /proc/mounts changes and the mount table can
> be scanned to see if something new is there. In this way we can reliably
> detect newly mounted filesystems. We can then match against a specifier to
> see if this is a file system in which we want to apply new rules. If so, we
> send the new rules to the kernel. When the device is unmounted, the kernel
> drops all watches on that file system. So, we only need to worry about when
> a device is mounted.
> 
> This works good for anything that gets mounted. But it is also possible for
> a USB flash drive to be accessed as a block device, such as the dd utility.
> If we had to detect device discovery, there is a netlink group,
> NETLINK_KOBJECT_UEVENT which we could monitor for events. The only thing is
> that we could only detect open/read/write/close/ioctl/lseek. And we probably
> do not want to monitor anything except block devices.
> 
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
> 
> Thoughts?

Would bind mounts trigger these rules? I'm sitting next to a box with 10k polyinstantiated bind mounts right now.

joe



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

