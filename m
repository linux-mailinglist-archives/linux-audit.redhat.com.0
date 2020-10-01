Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF1E27FEDE
	for <lists+linux-audit@lfdr.de>; Thu,  1 Oct 2020 14:19:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-DnrT6px0OueRk1jqhnxUgw-1; Thu, 01 Oct 2020 08:19:11 -0400
X-MC-Unique: DnrT6px0OueRk1jqhnxUgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F641009636;
	Thu,  1 Oct 2020 12:19:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 066EC5D9F1;
	Thu,  1 Oct 2020 12:19:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9B4B181A050;
	Thu,  1 Oct 2020 12:19:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091AOP4I030092 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 06:24:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E8602026F94; Thu,  1 Oct 2020 10:24:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A042200AF70
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:24:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A8C6811E76
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 10:24:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-CeTBeE0LM9eJNncsysiwlg-1;
	Thu, 01 Oct 2020 06:24:21 -0400
X-MC-Unique: CeTBeE0LM9eJNncsysiwlg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52B34AC2F;
	Thu,  1 Oct 2020 10:24:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 136F41E12EF; Thu,  1 Oct 2020 12:24:19 +0200 (CEST)
Date: Thu, 1 Oct 2020 12:24:19 +0200
From: Jan Kara <jack@suse.cz>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH 2/3] fanotify: define bit map fields to hold response
	decision  context
Message-ID: <20201001102419.GF17860@quack2.suse.cz>
References: <2745105.e9J7NaK4W3@x2>
 <20201001101219.GE17860@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201001101219.GE17860@quack2.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:18:34 -0400
Cc: Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
	linux-audit@redhat.com, linux-fsdevel@vger.kernel.org
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu 01-10-20 12:12:19, Jan Kara wrote:
> On Wed 30-09-20 12:12:28, Steve Grubb wrote:
> > This patch defines 2 bit maps within the response variable returned from
> > user space on a permission event. The first field is 3 bits for the context
> > type. The context type will describe what the meaning is of the second bit
> > field. The default is none. The patch defines one additional context type
> > which means that the second field is a rule number. This will allow for the
> > creation of 6 other context types in the future if other users of the API
> > identify different needs. The second field is 10 bits wide and can be used
> > to pass along the data described by the context. Neither of these bit maps
> > are directly adjacent and could be expanded if the need arises.
> > 
> > To support this, several macros were created to facilitate storing and
> > retrieving the values. There is also a macro for user space to check that
> > the data being sent is valid. Of course, without this check, anything that
> > overflows the bit field will trigger an EINVAL based on the use of
> > of INVALID_RESPONSE_MASK in process_access_response().
> > 
> > Signed-off-by: Steve Grubb <sgrubb@redhat.com>
> 
> So how likely do you find other context types are or that you'd need to
> further expand the information passed from userspace? Because if there are
> decent changes the expansion will be needed then I'd rather do something
> like:
> 
> struct fanotify_response {
> 	__s32 fd;
> 	__u16 response;
> 	__u16 extra_info_type;
> };
> 
> which is also backwards compatible and then userspace can set extra_info_type
> and based on the type we'd know how much more bytes we need to copy from
> buf to get additional information for that info type. 
> 
> This is much more flexible than what you propose and not that complex to
> implement, you get type safety for extra information and don't need to use
> macros to cram everything in u32 etc. Overall cleaner interface I'd say.
> 
> So in your case you'd then have something like:
> 
> #define FAN_RESPONSE_INFO_AUDIT_RULE 1
> 
> struct fanotify_response_audit_rule {
> 	__u32 rule;
> };

Now I realized we need to propagate the extra information through fanotify
permission event to audit - that can be also done relatively easily. Just
add '__u16 extra_info_type' to fanotify_perm_event and 'char
extra_info_buf[FANOTIFY_MAX_RESPONSE_EXTRA_LEN]' for now for the data. If
we ever grow larger extra info structures, we can always change this to
dynamic allocation but that will be only internal fanotify change,
userspace facing API can stay the same.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

