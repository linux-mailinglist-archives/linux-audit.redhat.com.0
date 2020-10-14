Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9278928E526
	for <lists+linux-audit@lfdr.de>; Wed, 14 Oct 2020 19:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602695632;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eqozEAPAvAEiHLTVr1wW22wtWod/OL8McoE9t/LCZK4=;
	b=PfD/0dn+A9HSPmyw4DCRIsOEruC3YSkqatHK0T0SXgjJLZ1WmW60j7ZoZzqdRbkg9vYt6Q
	e46CE5F389ZAfuVDNDeOkFrZGYY909vSlk3c/ZcJUu+7n9UiDXOYQDDaZUk/F8V0cjvU+X
	xDFAdvoRs6bX7gH7FU/EIlhACv059IE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-WL1SgLrrOxydOZzKi6PpHw-1; Wed, 14 Oct 2020 13:13:49 -0400
X-MC-Unique: WL1SgLrrOxydOZzKi6PpHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E7791015CAC;
	Wed, 14 Oct 2020 17:13:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 315595D9DD;
	Wed, 14 Oct 2020 17:13:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E4C25810F;
	Wed, 14 Oct 2020 17:13:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EHCKut001988 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 13:12:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F36C75C1C2; Wed, 14 Oct 2020 17:12:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-216.rdu2.redhat.com [10.10.114.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F7B25C1BD;
	Wed, 14 Oct 2020 17:12:16 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>
Subject: Re: Auditd is not turning off the system on (RHEL7.+)
Date: Wed, 14 Oct 2020 13:12:15 -0400
Message-ID: <4281677.LvFx2qVVIh@x2>
Organization: Red Hat
In-Reply-To: <1025996531.618266.1602694304884@mail.yahoo.com>
References: <1025996531.618266.1602694304884.ref@mail.yahoo.com>
	<1025996531.618266.1602694304884@mail.yahoo.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Wednesday, October 14, 2020 12:51:44 PM EDT Fabio Sbano wrote:
> My /etc/audit/auditd.conf is configured as below but it is not turning off
> the system
> 
> ## This file controls the configuration of the audit daemon#
> local_events = yeswrite_logs = yeslog_file =
> /var/log/audit/audit.loglog_group = rootlog_format = RAWflush =
> INCREMENTAL_ASYNCfreq = 50max_log_file = 8num_logs = 5priority_boost =
> 4disp_qos = lossydispatcher = /sbin/audispdname_format = NONE##name =
> mydomainmax_log_file_action = ROTATEspace_left = 75space_left_action =
> SYSLOGverify_email = yesaction_mail_acct = rootadmin_space_left =
> 50admin_space_left_action = haltdisk_full_action =
> SUSPENDdisk_error_action = SUSPENDuse_libwrap = yes##tcp_listen_port =
> 60tcp_listen_queue = 5tcp_max_per_addr = 1##tcp_client_ports =
> 1024-65535tcp_client_max_idle = 0enable_krb5 = nokrb5_principal =
> auditd##krb5_key_file = /etc/audit/audit.keydistribute_network = no
 
I believe this bz is relevant:
https://bugzilla.redhat.com/show_bug.cgi?id=1780332

If you update to the 7.9 release, it should work like it is supposed to.

Best Regards,
-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

