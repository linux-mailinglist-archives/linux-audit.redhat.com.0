Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678F67273E
	for <lists+linux-audit@lfdr.de>; Wed, 18 Jan 2023 19:41:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674067275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mn6xGyrrLsh4STNVq1mPpMXqYyTLdDfNsyeDFtSdiQU=;
	b=ScKcAEenjFGYi9oKU/PdO/KwMkHpkbdVFE+vA7ouhvWVVPvwv1IcVI0qXcE3ls3R75xURL
	z6CubH63LZ26YDhCNbcLf4N74amBFlMqJI1hokp/+QrRlmInArSdDvg51xNJcR+Tp21NOO
	TJB4nWMay6MHlA//jboFKl0u0BlYzqc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-mnsN8FpjPJu2L4rAgM33LA-1; Wed, 18 Jan 2023 13:41:13 -0500
X-MC-Unique: mnsN8FpjPJu2L4rAgM33LA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB4921C087B2;
	Wed, 18 Jan 2023 18:41:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E9D6492B01;
	Wed, 18 Jan 2023 18:41:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0C381946A76;
	Wed, 18 Jan 2023 18:41:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 710811946A6B for <linux-audit@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 18:25:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D1C4492B01; Wed, 18 Jan 2023 18:25:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25DA9492B00
 for <linux-audit@redhat.com>; Wed, 18 Jan 2023 18:25:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A550857F82
 for <linux-audit@redhat.com>; Wed, 18 Jan 2023 18:25:01 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-274-SGP_ykS_MEqsFcGV6roevA-1; Wed,
 18 Jan 2023 13:24:57 -0500
X-MC-Unique: SGP_ykS_MEqsFcGV6roevA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBF192047F;
 Wed, 18 Jan 2023 18:24:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBD8A138FE;
 Wed, 18 Jan 2023 18:24:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7PzVLXc5yGMdZQAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 18 Jan 2023 18:24:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1F863A06B2; Wed, 18 Jan 2023 19:24:55 +0100 (CET)
Date: Wed, 18 Jan 2023 19:24:55 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v6 0/3] fanotify: Allow user space to pass back
 additional audit info
Message-ID: <20230118182455.fdcfsrdrj2u7f5ux@quack3>
References: <cover.1673989212.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1673989212.git.rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 18 Jan 2023 18:41:03 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, linux-api@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue 17-01-23 16:14:04, Richard Guy Briggs wrote:
> The Fanotify API can be used for access control by requesting permission
> event notification. The user space tooling that uses it may have a
> complicated policy that inherently contains additional context for the
> decision. If this information were available in the audit trail, policy
> writers can close the loop on debugging policy. Also, if this additional
> information were available, it would enable the creation of tools that
> can suggest changes to the policy similar to how audit2allow can help
> refine labeled security.
> 
> This patchset defines a new flag (FAN_INFO) and new extensions that
> define additional information which are appended after the response
> structure returned from user space on a permission event.  The appended
> information is organized with headers containing a type and size that
> can be delegated to interested subsystems.  One new information type is
> defined to audit the triggering rule number.  
> 
> A newer kernel will work with an older userspace and an older kernel
> will behave as expected and reject a newer userspace, leaving it up to
> the newer userspace to test appropriately and adapt as necessary.  This
> is done by providing a a fully-formed FAN_INFO extension but setting the
> fd to FAN_NOFD.  On a capable kernel, it will succeed but issue no audit
> record, whereas on an older kernel it will fail.
> 
> The audit function was updated to log the additional information in the
> AUDIT_FANOTIFY record. The following are examples of the new record
> format:
>   type=FANOTIFY msg=audit(1600385147.372:590): resp=2 fan_type=1 fan_info=3137 subj_trust=3 obj_trust=5
>   type=FANOTIFY msg=audit(1659730979.839:284): resp=1 fan_type=0 fan_info=3F subj_trust=? obj_trust=?

Everything looks fine to me in this patchset so once patch 3/3 gets ack
from audit guys, I'll merge the series to my tree. Thanks for your work!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

