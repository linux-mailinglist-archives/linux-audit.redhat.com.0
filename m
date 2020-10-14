Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 393D228E62E
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 20:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602699672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7jNzGQv0fF8SGq/gv/nDhkMgM2/zI9c2h9bIdwE6d/A=;
	b=apYg+vTRir/fe6+d2KjJs7BPZKdkmW5gScKgp2Q3yjeqTK/Dy24sC5+XewpW3QwNJ5vGPF
	N2UqmTo9otB10qxfLy3rzxsgM/0/MOMd+xLeEBmdkaqzOrrmeOCY55KMPWuFolufcueih7
	eYnrXxoPtmL2Y1iDu2qG4qPctyMQVqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-9qwgWy7cNKyj2edRCyaJOg-1; Wed, 14 Oct 2020 14:21:07 -0400
X-MC-Unique: 9qwgWy7cNKyj2edRCyaJOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA6ED18A0761;
	Wed, 14 Oct 2020 18:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 935D46EF67;
	Wed, 14 Oct 2020 18:21:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E5BC5810F;
	Wed, 14 Oct 2020 18:21:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EIKviL009436 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 14:20:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DA0610021AA; Wed, 14 Oct 2020 18:20:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-216.rdu2.redhat.com [10.10.114.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 232C310013D0;
	Wed, 14 Oct 2020 18:20:54 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>,
	Fabio Sbano <fsbano@yahoo.com>
Subject: Re: Auditd is not turning off the system on (RHEL7.+)
Date: Wed, 14 Oct 2020 14:20:53 -0400
Message-ID: <3344292.iIbC2pHGDl@x2>
Organization: Red Hat
In-Reply-To: <1347666069.660171.1602699215591@mail.yahoo.com>
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
	<4281677.LvFx2qVVIh@x2>
	<1347666069.660171.1602699215591@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, October 14, 2020 2:13:35 PM EDT Fabio Sbano wrote:
> I'm using 7.x with latest update :-(
> Can i reopen the bug?

Sure. I think you'd probably want to add your AVC to give a hint.

-Steve

> ( I turned off selinux for the auditd to work the halt )
> Best Regards,Fabio Sbano
> 
> Sent from Yahoo Mail on Android
> 
>   On Wed, Oct 14, 2020 at 2:12 PM, Steve Grubb<sgrubb@redhat.com> wrote:  
> Hello,
> On Wednesday, October 14, 2020 12:51:44 PM EDT Fabio Sbano wrote:
> > My /etc/audit/auditd.conf is configured as below but it is not turning
> > off
> > the system
> > 
> > ## This file controls the configuration of the audit daemon#
> > local_events = yeswrite_logs = yeslog_file =
> > /var/log/audit/audit.loglog_group = rootlog_format = RAWflush =
> > INCREMENTAL_ASYNCfreq = 50max_log_file = 8num_logs = 5priority_boost =
> > 4disp_qos = lossydispatcher = /sbin/audispdname_format = NONE##name =
> > mydomainmax_log_file_action = ROTATEspace_left = 75space_left_action =
> > SYSLOGverify_email = yesaction_mail_acct = rootadmin_space_left =
> > 50admin_space_left_action = haltdisk_full_action =
> > SUSPENDdisk_error_action = SUSPENDuse_libwrap = yes##tcp_listen_port =
> > 60tcp_listen_queue = 5tcp_max_per_addr = 1##tcp_client_ports =
> > 1024-65535tcp_client_max_idle = 0enable_krb5 = nokrb5_principal =
> > auditd##krb5_key_file = /etc/audit/audit.keydistribute_network = no
> 
> I believe this bz is relevant:
> https://bugzilla.redhat.com/show_bug.cgi?id=1780332
> 
> If you update to the 7.9 release, it should work like it is supposed to.
> 
> Best Regards,
> -Steve




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

